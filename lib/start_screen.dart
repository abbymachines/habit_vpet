import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/heart_bar.dart';
import 'package:habit_vpet/pet_feeder.dart';

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
          const SizedBox(height: 20),
          const HeartBar(),
          const SizedBox(height: 10),
          const Center(
            child: PetFeeder(),
          ),
          const SizedBox(height: 30),
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
