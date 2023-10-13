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
  var _habitLength = 0;

  void refreshHealth() {
    return setState(() {
      _habitLength = widget.habitList.length;
      _health = _habitLength * 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    refreshHealth();
    return Text(_health.toString());
  }
}
