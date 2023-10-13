import 'package:flutter/material.dart';

import 'package:habit_vpet/models/habit.dart';

class HabitButton extends StatefulWidget {
  const HabitButton({this.attachedHabit, super.key});

  final Habit? attachedHabit;

  @override
  State<HabitButton> createState() => _HabitButtonState();
}

class _HabitButtonState extends State<HabitButton> {
  var _isComplete = false;

  void initialCompletion(Habit loadedHabit) {
    setState(() {
      _isComplete = loadedHabit.isComplete;
    });
  }

  void toggleHabitCompletion() {
    setState(() {
      if (_isComplete) {
        _isComplete = false;
      } else {
        _isComplete = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 60,
      onPressed: () {
        toggleHabitCompletion();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isComplete ? 'yummy 😋' : 'oh...'),
          ),
        );
      },
      icon: Icon(_isComplete ? Icons.check_box : Icons.check_box_outline_blank),
    );
  }
}
