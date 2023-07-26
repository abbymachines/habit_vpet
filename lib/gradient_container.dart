import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/worm.dart';
// import 'package:habit_vpet/heart.dart';
import 'package:habit_vpet/heart_bar.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 19, 52, 5),
            Color.fromARGB(255, 209, 243, 17)
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: ListView(
        addAutomaticKeepAlives: false,
        padding: const EdgeInsets.all(60),
        children: const [
          Center(child: StyledText()),
          Center(child: HeartBar()),
          Center(child: Worm()),
        ],
      ),
    );
  }
}
