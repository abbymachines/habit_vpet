import 'dart:math';
import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/heart_bar/heart_bar.dart';
import 'package:habit_vpet/widgets/pet/pet.dart';

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
      if (currentHealth >= 4) {
        currentHealth = 0;
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
        Pet(currentPetFrame),
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
