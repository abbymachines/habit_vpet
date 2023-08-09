import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/providers/completed_habits_provider.dart';

class HabitButton extends ConsumerWidget {
  const HabitButton({
    required this.attachedHabit,
    super.key,
  });

  final Habit attachedHabit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String labelText = false.toString();
    final completedHabits = ref.watch(completedHabitsProvider);

    final isComplete = completedHabits.contains(attachedHabit);

    return IconButton(
      iconSize: 60,
      onPressed: () {
        final wasCompleted = ref
            .read(completedHabitsProvider.notifier)
            .toggleHabitCompletionStatus(attachedHabit);
        labelText = wasCompleted.toString();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(wasCompleted ? 'yummy 😋' : 'oh...'),
          ),
        );
      },
      icon: Icon(isComplete ? Icons.check_box : Icons.check_box_outline_blank),
    );
  }
}
