import 'package:flutter/material.dart';

import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/providers/actual_health_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitButton extends ConsumerStatefulWidget {
  const HabitButton({this.attachedHabit, super.key});

  final Habit? attachedHabit;

  @override
  ConsumerState<HabitButton> createState() {
    return _HabitButtonState();
  }
}

class _HabitButtonState extends ConsumerState<HabitButton> {
  var _isComplete = false;

  void initialCompletion(Habit loadedHabit) {
    setState(() {
      _isComplete = loadedHabit.isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    final health = ref.watch(healthProvider);

    void toggleHabitCompletion() {
      setState(() {
        if (_isComplete) {
          _isComplete = false;
          ref.read(healthProvider.notifier).decrementHealth(health);
        } else {
          _isComplete = true;
          ref.read(healthProvider.notifier).incrementHealth(health);
        }
      });
    }

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
