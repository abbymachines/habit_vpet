import 'package:flutter/material.dart';
import 'package:habit_vpet/heart.dart';

class HeartBar extends StatelessWidget {
  const HeartBar({super.key});

  @override
  Widget build(context) {
    return const Row(children: <Widget>[
      Heart(),
      Heart(),
      Heart(),
      Heart(),
    ]);
  }
}
