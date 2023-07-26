import 'package:flutter/material.dart';

const fullHeart = '❤️';
const emptyHeart = '♡';

class Heart extends StatelessWidget {
  const Heart({super.key});

  @override
  Widget build(context) {
    return const Text(
      fullHeart,
      style: TextStyle(fontSize: 15),
    );
  }
}
