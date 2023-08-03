import 'package:flutter/material.dart';
import 'package:habit_vpet/habit_vpet.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 130, 134, 12),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: BorderSide(style: BorderStyle.solid),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
        ),
      ),
      home: const HabitVpet(),
    ),
  );
}
