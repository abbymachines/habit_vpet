import 'package:flutter/material.dart';

const fullHeart = '❤️';
const halfHeart = '❤️‍🩹';
const emptyHeart = '♡';

final heartBarStates = {
  0: emptyHeart,
  1: fullHeart,
  2: fullHeart + fullHeart,
  3: fullHeart + fullHeart + fullHeart,
  4: fullHeart + fullHeart + fullHeart + fullHeart,
};

class HeartBar extends StatelessWidget {
  const HeartBar(this.health, {super.key});

  final int health;

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        heartBarStates[health]!,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}