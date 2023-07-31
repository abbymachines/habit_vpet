import 'dart:math';
import 'package:flutter/material.dart';
import 'package:habit_vpet/heart_bar.dart';

final randomizer = Random();

class PetFeeder extends StatefulWidget {
  const PetFeeder({super.key});

  @override
  State<PetFeeder> createState() {
    return _PetFeederState();
  }
}

class _PetFeederState extends State<PetFeeder> {
  var currentPetFrame = 2;
  var currentHealth = 0;

  void feedPet() {
    setState(() {
      currentPetFrame = randomizer.nextInt(4) + 1;
      currentHealth += 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeartBar(currentHealth),
        Image.asset(
          'assets/images/worm$currentPetFrame.png',
          width: 200,
        ),
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
