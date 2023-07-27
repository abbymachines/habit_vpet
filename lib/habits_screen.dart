import 'package:flutter/material.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() {
    return _HabitsScreenState();
  }
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('The habit question...'),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Answer 3'),
          ),
        ],
      ),
    );
  }
}
