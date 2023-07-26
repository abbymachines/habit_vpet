import 'package:flutter/material.dart';
import 'package:habit_vpet/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 19, 52, 5),
          Color.fromARGB(255, 209, 243, 17),
        ),
      ),
    ),
  );
}
