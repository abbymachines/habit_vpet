import 'package:flutter/material.dart';
import 'package:habit_vpet/data/dummy_completed_habits.dart';

import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/providers/apparent_health_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HabitButton extends ConsumerStatefulWidget {
  const HabitButton(
      {required this.attachedHabit,
      required this.onRefreshHealth,
      required this.onCompleteHabit,
      required this.onUncompleteHabit,
      super.key});

  final Habit attachedHabit;
  final Function onRefreshHealth;
  final void Function(Habit habit) onCompleteHabit;
  final void Function(Habit habit) onUncompleteHabit;

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
    final health = ref.watch(apparentHealthProvider);
    final habit = widget.attachedHabit;

    void toggleHabitCompletion() {
      if (_isComplete) {
        setState(() {
          _isComplete = false;
          ref.read(apparentHealthProvider.notifier).decrementHealth(health);
          // dummyCompletedHabits.add(habit);
          widget.onUncompleteHabit;
        });
        // dummyCompletedHabits.add(habit);
      } else {
        setState(() {
          _isComplete = true;
          ref.read(apparentHealthProvider.notifier).incrementHealth(health);
          // dummyCompletedHabits.remove(habit);
          widget.onCompleteHabit;
        });
        // dummyCompletedHabits.remove(habit);
      }
      print('completed habits length: ${dummyCompletedHabits.length}');
      print('all the completed habits: $dummyCompletedHabits');
    }

    return IconButton(
      iconSize: 60,
      onPressed: () {
        toggleHabitCompletion();
        widget.onRefreshHealth();
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
