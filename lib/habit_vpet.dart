import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/data/dummy_data.dart';

import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/providers/apparent_health_provider.dart';

import 'package:habit_vpet/providers/habits_provider.dart';

import 'package:habit_vpet/pet_status_message.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';
import 'package:habit_vpet/widgets/new_habit.dart';
import 'package:habit_vpet/widgets/pet/pet.dart';

class HabitVpet extends ConsumerStatefulWidget {
  const HabitVpet({super.key});

  @override
  ConsumerState<HabitVpet> createState() {
    return _HabitVpetState();
  }
}

class _HabitVpetState extends ConsumerState<HabitVpet> {
  var _completedHabitsLength = 0;
  final List<Habit> _completedHabits = [];
  var _actualHealth = 0;
  var _apparentHealth = 0;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleHabit(Habit habit) {
    final isExisting = _completedHabits.contains(habit);

    if (isExisting) {
      setState(() {
        _completedHabits.remove(habit);
        _completedHabitsLength = _completedHabits.length;
      });
      _decrementApparentHealth();
      _showInfoMessage('🛑Habit marked INCOMPLETE🛑');
    } else {
      setState(() {
        _completedHabits.add(habit);
        _completedHabitsLength = _completedHabits.length;
      });
      _incrementApparentHealth();
      _showInfoMessage('✅ Habit marked COMPLETE! :^) ✅');
    }
    _refreshCompletedHabitsLength();
    _refreshActualHealth();
  }

  void _incrementApparentHealth() {
    if (_apparentHealth < 4) {
      setState(() {
        _apparentHealth += 1;
      });
    }
  }

  void _decrementApparentHealth() {
    if (_apparentHealth > _actualHealth) {
      setState(() {
        _apparentHealth -= 1;
      });
    }
  }

  void _refreshActualHealth() {
    setState(() {
      _actualHealth =
          ((_completedHabitsLength / dummyHabits.length) * 4).floor();
    });
  }

  void _refreshCompletedHabitsLength() {
    setState(() {});
  }

  void _openAddHabitOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewHabit(onAddHabit: _addHabit),
    );
  }

  void _addHabit(Habit habit) {
    setState(() {
      dummyHabits.add(habit);
    });
  }

  void _removeHabit(Habit habit) {
    final habitIndex = dummyHabits.indexOf(habit);

    setState(() {
      dummyHabits.remove(habit);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Habit deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              dummyHabits.insert(habitIndex, habit);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitsProvider);
    // final health = ref.watch(apparentHealthProvider);

    Widget habitContent = const Center(
      child: Text('No habits found. Start adding some!'),
    );

    if (habits.isNotEmpty) {
      habitContent = HabitList(
        habits: habits,
        onRemoveHabit: _removeHabit,
        onRefreshHealth: _refreshCompletedHabitsLength,
        onToggleHabit: _toggleHabit,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'completed habits: ${_completedHabitsLength.toString()} / ${habits.length}',
        ),
        actions: [
          IconButton(
            onPressed: _openAddHabitOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 19, 52, 5),
              Color.fromARGB(255, 209, 243, 17),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Pet(
              actualHealth: _actualHealth,
              apparentHealth: _apparentHealth,
            ),
            const SizedBox(height: 20),
            PetStatusMessage(_actualHealth),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      // ref
                      //     .read(apparentHealthProvider.notifier)
                      //     .startCountdown(health);
                    },
                    child: const Text('starve mi')),
                TextButton(
                  onPressed: () {
                    // ref
                    //     .read(apparentHealthProvider.notifier)
                    //     .incrementHealth(health);
                  },
                  child: const Text('feed mi'),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      print(
                        ref.watch(habitsProvider),
                      );
                    },
                    child: const Text('all habits')),
                TextButton(
                    onPressed: () {
                      print(_completedHabits);
                    },
                    child: const Text('completed habits')),
              ],
            ),
            Expanded(
              flex: 5,
              child: habitContent,
            ),
          ],
        ),
      ),
    );
  }
}
