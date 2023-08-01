import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
// import 'package:habit_vpet/widgets/heart_bar/heart_bar.dart';
import 'package:habit_vpet/widgets/pet/pet_feeder.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startHabits, {super.key});

  final void Function() startHabits;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const StyledText(
              'your worm is a happy worm (replace me with widget)'),
          const SizedBox(height: 20),
          // const HeartBar(3),
          // const SizedBox(height: 10),
          const Center(
            child: PetFeeder(),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startHabits,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_circle_right),
            label: const Text('habits'),
          ),
        ],
      ),
    );
  }
}
