import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_item.dart';

class HabitList extends StatelessWidget {
  const HabitList(this.habits, {super.key});

  final List<Habit> habits;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (ctx, index) => HabitItem(habits[index]),
    );
  }
}
