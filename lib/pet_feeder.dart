import 'package:flutter/material.dart';
// import 'package:habit_vpet/worm.dart';

class PetFeeder extends StatefulWidget {
  const PetFeeder({super.key});

  @override
  State<PetFeeder> createState() {
    return _PetFeederState();
  }
}

class _PetFeederState extends State<PetFeeder> {
  var activePetImage = 'assets/images/worm2.png';

  void feedPet() {
    setState(() {
      activePetImage = 'assets/images/worm4.png';
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(activePetImage, width: 200),
        TextButton(
          onPressed: feedPet,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28)),
          child: const Text('feed me!'),
        ),
      ],
    );
  }
}
