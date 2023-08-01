import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; // ⚠️ IMPORT UUID AND MAKE USE OF IT!

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
  Habit(this.description,
      {required this.title,
      required this.frequency,
      required this.habitColor,
      required this.isComplete})
      : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final String frequency;
  final String habitColor;
  final String isComplete;
}
