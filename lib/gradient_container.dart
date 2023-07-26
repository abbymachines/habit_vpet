import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/worm.dart';
import 'package:habit_vpet/heart_bar.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: ListView(
        addAutomaticKeepAlives: false,
        padding: const EdgeInsets.all(60),
        children: const [
          Center(child: StyledText('your worm is a happy worm')),
          Center(child: HeartBar()),
          Center(child: Worm()),
        ],
      ),
    );
  }
}
