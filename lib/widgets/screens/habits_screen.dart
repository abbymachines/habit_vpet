import 'package:flutter/material.dart';
import 'package:habit_vpet/habit_button.dart';
import 'package:habit_vpet/data/questions.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<HabitsScreen> createState() {
    return _HabitsScreenState();
  }
}

class _HabitsScreenState extends State<HabitsScreen> {
  var currentHabitIndex = 0;

  void answerHabitQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentHabitIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentHabitIndex];

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
            ...currentQuestion.getShuffledAnswers().map(
              (answer) {
                return HabitButton(
                  answerText: answer,
                  onTap: () {
                    answerHabitQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}