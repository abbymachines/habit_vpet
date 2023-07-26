import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/worm.dart';
// import 'package:habit_vpet/heart.dart';
import 'package:habit_vpet/heart_bar.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 19, 52, 5),
            Color.fromARGB(255, 209, 243, 17)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: ListView(
        addAutomaticKeepAlives: false,
        children: const [
          Center(child: StyledText()),
          Center(child: HeartBar()),
          Center(child: Worm()),
        ],
      ),
    );
  }
}
