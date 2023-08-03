import 'dart:math';
import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/heart_bar/heart_bar.dart';

final randomizer = Random();

class PetFeeder extends StatefulWidget {
  const PetFeeder({super.key});

  @override
  State<PetFeeder> createState() {
    return _PetFeederState();
  }
}

class _PetFeederState extends State<PetFeeder> {
  var currentHealth = 0;

  void feedPet() {
    setState(() {
      if (currentHealth >= 4) {
        currentHealth = -1;
      }
      currentHealth++;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeartBar(currentHealth),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: feedPet,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.fastfood),
          label: const Text('Feed Pet'),
        ),
      ],
    );
  }
}
