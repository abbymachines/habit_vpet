import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/providers/completed_habits_provider.dart';

class HabitButton extends ConsumerWidget {
  const HabitButton({
    required this.attachedHabit,
    // required this.onCompleteHabit,
    // required this.completionStatus,
    super.key,
  });

  final Habit attachedHabit;
  // final Function() onCompleteHabit;
  // final bool completionStatus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String labelText = false.toString();

    return OutlinedButton.icon(
      onPressed: () {
        final wasCompleted = ref
            .read(completedHabitsProvider.notifier)
            .toggleHabitCompletionStatus(attachedHabit);
        labelText = wasCompleted.toString();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(wasCompleted
                ? 'Habit completed ($labelText)'
                : 'Habit un-completed ($labelText)'),
          ),
        );
      },
      icon: const Icon(Icons.copyright),
      label: Text(
        labelText,
      ),
    );
  }
}
