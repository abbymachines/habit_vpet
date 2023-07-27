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
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return HabitButton(answerText: answer, onTap: () {});
            }),
          ],
        ),
      ),
    );
  }
}
