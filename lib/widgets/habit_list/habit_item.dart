import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_button.dart';

class HabitItem extends StatelessWidget {
  const HabitItem(
    this.habit,
    this.onRefreshHealth, {
    super.key,
    required this.onToggleHabit,
    this.isComplete = false,
  });

  final Habit habit;
  final Function onRefreshHealth;
  final void Function(Habit habit) onToggleHabit;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: habit.habitColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              habit.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                Text(habit.frequency),
                const Spacer(),
                HabitButton(
                  attachedHabit: habit,
                  onRefreshHealth: onRefreshHealth,
                  isComplete: isComplete,
                  onToggleHabit: onToggleHabit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
