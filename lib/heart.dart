import 'package:flutter/material.dart';

// const fullHeart = '❤️';
// const emptyHeart = '♡';

class Heart extends StatelessWidget {
  const Heart(this.heartStatus, {super.key});

  final String heartStatus;

  @override
  Widget build(context) {
    return Text(
      heartStatus,
      style: const TextStyle(fontSize: 15),
    );
  }
}
