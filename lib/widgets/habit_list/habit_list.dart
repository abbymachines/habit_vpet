import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';

class HeartList extends StatelessWidget {
  const HabitList(this.habits, {super.key});

  final List<Habit> habits;

  @override
  Widget build(context) {
    return ListView.builder(itemCount: habits.length, itemBuilder: (ctx, index) => Habit(habits[index]));
  }

}