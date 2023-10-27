import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/heart_bar/heart_bar.dart';
import 'package:habit_vpet/widgets/pet/frame_changer.dart';

class Pet extends StatelessWidget {
  const Pet(
      {required this.health,
      // required this.incrementer,
      super.key});

  // final int currentPetFrame;
  final int health;
  // final Function incrementer;

  // @override
  // State<Pet> createState() {
  //   return _PetState();
  // }
  @override
  Widget build(context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Column(
        children: [
          HeartBar(health),
          // FrameChanger(),
          Image.asset('assets/images/worm1.png', width: 200),
          // TextButton(onPressed: incrementer, child: child),
        ],
      ),
    );
  }
}
