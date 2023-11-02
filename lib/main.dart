import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // NEED TO ADD TO PUBSPEC

import 'package:habit_vpet/habit_vpet.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 130, 134, 12),
);

final helloWorldProvider = Provider<String>((ref) {
  return 'Hello world!! shout out to world';
});

// final healthProvider = Provider<int>((ref) {
//   return 0;
// });

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    // final int health = ref.read(healthProvider);
    // final int health = 0;

    return MaterialApp(
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
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'habit pet',
          ),
        ),
        body: HabitVpet(
            // health: healthProvider,
            ),
      ),
    );
  }
}
