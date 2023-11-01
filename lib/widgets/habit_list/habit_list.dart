import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_item.dart';

class HabitList extends StatefulWidget {
  const HabitList({
    super.key,
    required this.habits,
    required this.onRemoveHabit,
  });

  final List<Habit> habits;
  final void Function(Habit habit) onRemoveHabit;

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.habits.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          widget.habits[index],
        ),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Theme.of(context).colorScheme.error,
        ),
        onDismissed: (direction) {
          widget.onRemoveHabit(widget.habits[index]);
        },
        child: HabitItem(
          widget.habits[index],
        ),
      ),
    );
  }
}
