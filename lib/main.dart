import 'package:flutter/material.dart';
import 'package:habit_vpet/habit_vpet.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.red,
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
      ),
      home: const HabitVpet(),
    ),
  );
}
