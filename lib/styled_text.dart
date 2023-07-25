import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return const Text(
      'your worm is a happy worm',
      style: TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
