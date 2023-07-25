import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 73, 229, 253),
        body: Center(
          child: Text('your worm is a happy worm'),
        ),
      ),
    ),
  );
}

// THE TAMAGOTCHI

// the tamagotchi will have a value for "hunger"
// this will be a value in the range of 0 to 4.

// it will also have a hidden value for "time"
// this will be a 3-point scale that gets incremented
// through over a period of time. each point represents a
// day at that value. as the time increments,
// the condition of the 

// the habit trackers