import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/pet_status_message.dart';
import 'package:habit_vpet/providers/completed_habits_provider.dart';
import 'package:habit_vpet/widgets/pet/pet_feeder.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';
import 'package:habit_vpet/widgets/new_habit.dart';
import 'package:habit_vpet/widgets/pet/frame_changer.dart';
import 'package:habit_vpet/data/dummy_data.dart';
import 'package:habit_vpet/providers/habits_provider.dart';

class HabitVpet extends ConsumerStatefulWidget {
  const HabitVpet({super.key});

  @override
  ConsumerState<HabitVpet> createState() {
    return _HabitVpetState();
  }
}

class _HabitVpetState extends ConsumerState<HabitVpet> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'habits-screen';
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
    final myHabits = ref.watch(habitsProvider);

    Widget habitContent = const Center(
      child: Text('No habits found. Start adding some!'),
    );

    if (dummyHabits.isNotEmpty) {
      habitContent = HabitList(
        habits: myHabits,
        onRemoveHabit: _removeHabit,
      );
    }

    final completedHabits = ref.watch(completedHabitsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('habit vpet'),
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
            const PetStatusMessage('thine worm is a contented worm'),
            const SizedBox(height: 20),
            Text('there are ${completedHabits.length} completed habits'),
            const SizedBox(height: 5),
            const Center(
              child: PetFeeder(),
            ),
            const Center(
              child: FrameChanger(),
            ),
            const SizedBox(height: 30),
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
