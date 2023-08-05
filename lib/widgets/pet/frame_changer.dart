import 'dart:math';
import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/pet/pet.dart';
import 'dart:async';
// import 'package:habit_vpet/main.dart';

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
    // const seconds = Duration(seconds: 5);
    // Timer.periodic(seconds, (Timer t) => _changeFrame());
    final stopwatch = Stopwatch()..start();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print(timer.tick);
      if (timer.tick == 1) {
        while (stopwatch.elapsedMilliseconds < 2000) {
          // Run uninterrupted for another 3.5 seconds!
          // The latest due tick after that is the 4-second tick.
          _changeFrame();
        }
      } else {
        timer.cancel();
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Pet(currentPetFrame),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
