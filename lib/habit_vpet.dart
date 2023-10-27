import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/main.dart';

import 'package:habit_vpet/pet_status_message.dart';
import 'package:habit_vpet/widgets/heart_bar/heart_bar.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';
import 'package:habit_vpet/widgets/new_habit.dart';

import 'package:habit_vpet/widgets/pet/frame_changer.dart';
import 'package:habit_vpet/data/dummy_data.dart';
import 'package:habit_vpet/widgets/state/health.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/widgets/pet/pet.dart';
import 'package:habit_vpet/providers/health_provider.dart';
import 'package:habit_vpet/providers/habits_provider.dart';

class HabitVpet extends ConsumerStatefulWidget {
  const HabitVpet({super.key});

  @override
  ConsumerState<HabitVpet> createState() {
    return _HabitVpetState();
  }
}

class _HabitVpetState extends ConsumerState<HabitVpet> {
  var _activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      _activeScreen = 'habits-screen';
    });
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

  void _toggleHabitCompletion(Habit habit) {
    print('not exactly how i want to build it');
    // ref.read(healthProvider.notifier).incrementHealth(health);
  }

  void _removeHabit(Habit habit) {
    final habitIndex = dummyHabits.indexOf(habit);

    if (habit.isComplete == true) {
      _toggleHabitCompletion(habit);
    }

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
            if (habit.isComplete == false) {
              _toggleHabitCompletion(habit);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitsProvider);
    final health = ref.watch(healthProvider);

    Widget habitContent = const Center(
      child: Text('No habits found. Start adding some!'),
    );

    if (habits.isNotEmpty) {
      habitContent = HabitList(
        habits: habits,
        onRemoveHabit: _removeHabit,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'still figuring out Providers...',
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
            Pet(health: health),
            const SizedBox(height: 20),
            PetStatusMessage(health),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      ref.read(healthProvider.notifier).decrementHealth(health);
                    },
                    child: Text('starve mi')),
                TextButton(
                  onPressed: () {
                    ref.read(healthProvider.notifier).incrementHealth(health);
                  },
                  child: Text('feed mi'),
                ),
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
