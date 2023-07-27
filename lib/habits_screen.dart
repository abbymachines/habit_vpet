import 'package:flutter/material.dart';
import 'package:habit_vpet/habit_button.dart';
import 'package:habit_vpet/data/questions.dart';

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
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 30),
          HabitButton(answerText: currentQuestion.answers[0], onTap: () {}),
          HabitButton(answerText: currentQuestion.answers[1], onTap: () {}),
          HabitButton(answerText: currentQuestion.answers[2], onTap: () {}),
        ],
      ),
    );
  }
}
