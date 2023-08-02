import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';

class HabitItem extends StatelessWidget {
  const HabitItem(this.habit, {super.key});

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(habit.title),
            const SizedBox(height: 4),
            Container(
              color: habit.habitColor,
              child: Row(
                children: [
                  Text(habit.description),
                  const Spacer(),
                  Text(habit.frequency),
                  const SizedBox(width: 2),
                  Text('${habit.isComplete}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
