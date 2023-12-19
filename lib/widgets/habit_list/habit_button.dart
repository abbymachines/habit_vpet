import 'package:flutter/material.dart';
// import 'package:habit_vpet/data/dummy_completed_habits.dart';

import 'package:habit_vpet/models/habit.dart';
// import 'package:habit_vpet/providers/apparent_health_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/data/dummy_data.dart';

class HabitButton extends StatefulWidget {
  const HabitButton(
      {required this.attachedHabit,
      required this.onRefreshHealth,
      // required this.isComplete,
      required this.onToggleHabit,
      super.key});

  final Habit attachedHabit;
  final Function onRefreshHealth;
  // final bool isComplete;
  final void Function(Habit habit) onToggleHabit;

  @override
  State<HabitButton> createState() {
    return _HabitButtonState();
  }
}

class _HabitButtonState extends State<HabitButton> {
  var _isComplete = false;

  @override
  Widget build(BuildContext context) {
    void toggleHabitCompletion() {
      if (_isComplete) {
        setState(() {
          _isComplete = false;

          widget.onRefreshHealth;
        });
        // dummyCompletedHabits.add(habit);
      } else {
        setState(() {
          _isComplete = true;
          // ref.read(apparentHealthProvider.notifier).incrementHealth(health);
          // dummyCompletedHabits.remove(habit);
          widget.onRefreshHealth;
        });
        // dummyCompletedHabits.remove(habit);
      }
    }

    return IconButton(
      iconSize: 60,
      onPressed: () {
        widget.onToggleHabit(widget.attachedHabit);
        toggleHabitCompletion();
        widget.onRefreshHealth();
        // ScaffoldMessenger.of(context).clearSnackBars();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(_isComplete ? 'yummy 😋' : 'oh...'),
        //   ),
        // );
        print('habit button pressed (habit_button.dart)');
      },
      icon: Icon(_isComplete ? Icons.check_box : Icons.check_box_outline_blank),
      // icon: const Icon(Icons.check_box_outline_blank),
    );
  }
}
