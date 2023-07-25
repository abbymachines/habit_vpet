import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 73, 229, 253),
            Color.fromARGB(255, 188, 233, 255)
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
