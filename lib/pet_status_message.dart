import 'package:flutter/material.dart';

const statusMessages = {
  0: 'oh dear. oh dear. oh dear',
  1: 'please feed me 🥺😭💩',
  2: '🫥 i should probably eat huh',
  3: '😊 feeling good. & i could go for a snack soon maybe 😛',
  4: '😇😇😇 mine stomach is a full stomach',
  5: 'lmao u messed up. wrong number baby'
};

class PetStatusMessage extends StatelessWidget {
  const PetStatusMessage(this.health, {super.key});

  final int health;

  @override
  Widget build(context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: Text(
        statusMessages[health]!,
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
