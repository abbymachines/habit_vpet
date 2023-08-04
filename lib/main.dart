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
            side: BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
              width: .3,
            ),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.shadow,
          ),
        ),
      ),
      home: const HabitVpet(),
    ),
  );
}
