import 'package:flutter/material.dart';
import 'package:habit_vpet/heart.dart';

const fullHeart = '❤️';
const emptyHeart = '♡';

class HeartBar extends StatelessWidget {
  const HeartBar({super.key});

  @override
  Widget build(context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Heart(fullHeart),
        Heart(fullHeart),
        Heart(fullHeart),
        Heart(emptyHeart),
      ],
    );
  }
}
