import 'package:flutter/material.dart';

class Pet extends StatelessWidget {
  const Pet(this.currentPetFrame, {super.key});

  final int currentPetFrame;

  @override
  Widget build(context) {
    return Image.asset('assets/images/worm$currentPetFrame.png', width: 200);
  }
}