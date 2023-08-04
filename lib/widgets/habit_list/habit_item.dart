import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';

class HabitItem extends StatelessWidget {
  const HabitItem(this.habit, {super.key});

  final Habit habit;

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
            Text(habit.title),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                Text(habit.frequency),
                const Spacer(),
                Text('${habit.isComplete}')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
