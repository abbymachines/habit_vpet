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
  var currentPetFrame = 0;

  void _changeFrame() {
    setState(() {
      currentPetFrame = randomizer.nextInt(4);
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
        OutlinedButton(
          onPressed: _changeFrame,
          child: const Text('pet the worm'),
        ),
      ],
    );
  }
}
