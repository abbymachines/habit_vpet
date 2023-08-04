import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';

class HabitButton extends StatelessWidget {
  const HabitButton({
    required this.attachedHabit,
    required this.onCompleteHabit,
    required this.completionStatus,
    super.key,
  });

  final Habit attachedHabit;
  final Function() onCompleteHabit;
  final bool completionStatus;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onCompleteHabit,
      icon: const Icon(Icons.copyright),
      label: Text(
        completionStatus.toString(),
      ),
    );
  }
}
