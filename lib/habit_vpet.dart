import 'package:flutter/material.dart';

import 'package:habit_vpet/widgets/screens/habits_screen.dart';
import 'package:habit_vpet/widgets/screens/results_screen.dart';
import 'package:habit_vpet/widgets/screens/start_screen.dart';
import 'package:habit_vpet/data/questions.dart';
import 'package:habit_vpet/models/habit.dart';

class HabitVpet extends StatefulWidget {
  const HabitVpet({super.key});

  @override
  State<HabitVpet> createState() {
    return _HabitVpetState();
  }
}

class _HabitVpetState extends State<HabitVpet> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'habits-screen';
    });
  }

  // void chooseAnswer(String answer) {
  //   selectedAnswers.add(answer);

  //   if (selectedAnswers.length == questions.length) {
  //     setState(() {
  //       activeScreen = 'results-screen';
  //     });
  //   }
  // }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    // if (activeScreen == 'habits-screen') {
    //   screenWidget = const HabitsScreen(
    //     onSelectAnswer: chooseAnswer,
    //   );
    // }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 19, 52, 5),
                Color.fromARGB(255, 209, 243, 17),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
