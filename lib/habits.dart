import 'package:flutter/material.dart';
import 'package:habit_vpet/habits_screen.dart';
import 'package:habit_vpet/start_screen.dart';

class Habits extends StatefulWidget {
  const Habits({super.key});

  @override
  State<Habits> createState() {
    return _HabitsState();
  }
}

class _HabitsState extends State<Habits> {
  // Widget? activeScreen;

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'habits-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'habits-screen') {
      screenWidget = const HabitsScreen();
    }

    return MaterialApp(
      home: Scaffold(
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
