import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';

class HabitButton extends StatefulWidget {
  const HabitButton(
      {required this.isComplete,
      required this.isGoalMet,
      required this.habit,
      super.key});

  final bool isComplete;
  final bool isGoalMet;
  final Habit habit;
}
