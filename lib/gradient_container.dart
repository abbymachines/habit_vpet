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

  void feedPet() {
    //
  }

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
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const StyledText('your worm is a happy worm'),
            const HeartBar(),
            const Worm(),
            TextButton(
              onPressed: feedPet,
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28)),
              child: const Text('feed me!'),
            ),
          ],
        ),
      ),
    );
  }
}
