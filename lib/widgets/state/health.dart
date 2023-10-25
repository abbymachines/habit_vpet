import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';
import 'package:habit_vpet/models/habit.dart';

class Health extends StatefulWidget {
  const Health({
    super.key,
    required this.habitList,
  });

  final List<Habit> habitList;

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  var _health = 0;
  List<Habit> _habitsList = [];
  List<Habit> _completedHabitsList = [];
  var _habitsLength = 0;
  var _completedHabitsLength = 0;

  void refreshHabitsList() {
    setState(() {
      _habitsList = widget.habitList;
    });
  }

  void countCompletedHabits(habitsList) {
    setState(() {
      _completedHabitsList = [];
    });

    for (final habit in _habitsList) {
      if (habit.isComplete) {
        setState(() {
          _completedHabitsList.add(habit);
        });
      }
    }

    setState(() {
      _completedHabitsLength = _completedHabitsList.length;
    });

    refreshHealth();
  }

  void refreshHealth() {
    return setState(() {
      _habitsLength = widget.habitList.length;
      _health = _habitsLength * _completedHabitsLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    refreshHabitsList();
    countCompletedHabits(widget.habitList);
    // refreshHealth();
    return Text(_health.toString());
  }
}
