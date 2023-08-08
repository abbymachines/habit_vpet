import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/habit_vpet.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 130, 134, 12),
);

// ⚠️ you left off by implementing riverpods and wrapping your
// app in a ProviderScope() widget so you can run it using
// app-wide state. you just finished lesson 181 of the udemy
// course, you now need to finish lesson 182.

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      ProviderScope(
        child: MaterialApp(
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
      ),
    );
  });
}
