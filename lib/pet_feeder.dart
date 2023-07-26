import 'dart:math';
import 'package:flutter/material.dart';

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

  void feedPet() {
    setState(() {
      currentPetFrame = randomizer.nextInt(4) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/worm$currentPetFrame.png', width: 200),
        OutlinedButton.icon(
          onPressed: feedPet,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          icon: const Icon(Icons.fastfood),
          label: const Text('feed me!'),
        ),
      ],
    );
  }
}
