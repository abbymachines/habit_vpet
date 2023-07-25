import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/worm.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 5, 6, 6),
            Color.fromARGB(255, 188, 233, 255)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      // child: const Column(
      //   children: [
      //     Center(
      //       child: StyledText(),
      //     ),
      //     Worm(),
      //   ],

      child: ListView(
        children: const [Center(child: StyledText()), Center(child: Worm())],
      ),
    );
  }
}
