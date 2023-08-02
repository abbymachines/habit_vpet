import 'package:flutter/material.dart';

class Pet extends StatelessWidget {
  const Pet(this.currentPetFrame, {super.key});

  final int currentPetFrame;

  @override
  Widget build(context) {
    return SizedBox(
      width: 300,
      height: 100,
      child: Image.asset('assets/images/worm$currentPetFrame.png', width: 200),
    );
  }
}
