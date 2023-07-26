import 'package:flutter/material.dart';

var fullHeart = '❤️';
var emptyHeart = '♡';

class Heart extends StatelessWidget {
  const Heart({super.key});

  @override
  Widget build(context) {
    return Text(
      fullHeart,
      style: const TextStyle(fontSize: 15),
    );
  }
}
