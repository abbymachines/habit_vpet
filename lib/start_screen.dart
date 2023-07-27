import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/heart_bar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startHabits, {super.key});

  final void Function() startHabits;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const StyledText('your worm is a happy worm'),
          const SizedBox(height: 80),
          const HeartBar(),
          Image.asset('assets/images/worm1.png', width: 200),
          const SizedBox(height: 70),
          OutlinedButton.icon(
            onPressed: startHabits,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.fastfood),
            label: const Text('habits'),
          ),
        ],
      ),
    );
  }
}
