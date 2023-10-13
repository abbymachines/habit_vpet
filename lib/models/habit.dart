import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum HabitColor { red, orange, yellow, green, blue, purple }

const habitColorHexes = {
  HabitColor.red: Color.fromARGB(255, 224, 1, 1),
  HabitColor.orange: Color.fromARGB(255, 255, 128, 69),
  HabitColor.yellow: Color.fromARGB(255, 253, 249, 0),
  HabitColor.green: Color.fromARGB(255, 52, 187, 28),
  HabitColor.blue: Color.fromARGB(255, 118, 195, 240),
  HabitColor.purple: Color.fromARGB(255, 171, 26, 228),
};

class Habit {
  Habit(
    this.description, {
    required this.title,
    required this.frequency,
    required this.habitColor,
    this.isComplete = false,
    // required this.isGoalMet, // implement later
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final String frequency;
  final Color habitColor;
  final bool isComplete;
  // final bool isGoalMet; // implement later
}

  //  i got stuck here on 2023.8.4. i'm trying
  // to track state somehow. i want...
  // total completed habits (all habits where isComplete == true)
  // total habits (the amount of habits there are in total)
  // health =  ((totalCompletedHabits / totalHabits) * 4)
  // the 'health value will then be passed into the heartbar, to determine how many hearts are shown.
  // that should subsequently change the message displayed above the hearts (and this message should be its own widget)
