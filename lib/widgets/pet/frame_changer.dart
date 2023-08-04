import 'dart:math';
import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/pet/pet.dart';

final randomizer = Random();

class FrameChanger extends StatefulWidget {
  const FrameChanger({super.key});

  @override
  State<FrameChanger> createState() {
    return _FrameChangerState();
  }
}

class _FrameChangerState extends State<FrameChanger> {
  var currentPetFrame = 2;

  void changeFrame() {
    setState(() {
      currentPetFrame = randomizer.nextInt(4) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Pet(currentPetFrame),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: changeFrame,
          icon: const Icon(Icons.movie),
          label: const Text('change frame'),
        ),
      ],
    );
  }
}
