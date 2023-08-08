import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_completer.dart';

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
                Text('${habit.isComplete}'),
                HabitCompleter(
                  habit: habit,
                ),
                // OutlinedButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.copyright),
                //   label: Text(
                //     habit.isComplete.toString(),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
