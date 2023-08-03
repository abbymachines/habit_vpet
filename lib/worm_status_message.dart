import 'package:flutter/material.dart';

class PetStatusMessage extends StatelessWidget {
  const PetStatusMessage(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return SizedBox(
      width: 350,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontStyle: FontStyle.italic,
            backgroundColor: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
