import 'package:flutter/material.dart';
import 'package:habit_vpet/habit_vpet.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      home: HabitVpet(),
    ),
  );
}
