import 'package:flutter/material.dart';
import 'package:habit_vpet/habit_button.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() {
    return _HabitsScreenState();
  }
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The habit question...',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          HabitButton(answerText: 'Habit 1', onTap: () {}),
          HabitButton(answerText: 'Habit 2', onTap: () {}),
          HabitButton(answerText: 'Habit 3', onTap: () {}),
        ],
      ),
    );
  }
}
