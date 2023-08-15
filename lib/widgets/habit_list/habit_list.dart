import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_item.dart';

class HabitList extends StatelessWidget {
  const HabitList({
    super.key,
    required this.habits,
    required this.onRemoveHabit,
  });

  final List<Habit> habits;
  final void Function(Habit habit) onRemoveHabit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          habits[index],
        ),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).colorScheme.error,
        ),
        onDismissed: (direction) {
          onRemoveHabit(habits[index]);
        },
        child: HabitItem(
          habits[index],
        ),
      ),
    );
  }
}
