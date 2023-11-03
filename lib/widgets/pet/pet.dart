import 'package:flutter/material.dart';
import 'package:habit_vpet/providers/actual_health_provider.dart';
import 'package:habit_vpet/providers/apparent_health_provider.dart';
import 'package:habit_vpet/widgets/heart_bar/heart_bar.dart';
import 'package:habit_vpet/widgets/pet/actual_health.dart';
import 'package:habit_vpet/widgets/pet/frame_changer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/models/habit.dart';

class Pet extends ConsumerStatefulWidget {
  const Pet(
      {
      // required this.apparentHealth,
      required this.actualHealth,
      // required this.onToggleHabit,
      super.key});

  @override
  ConsumerState<Pet> createState() {
    return _PetState();
  }

  // final int apparentHealth;
  final int actualHealth;
  // final Function(Habit habit) onToggleHabit;
}

class _PetState extends ConsumerState<Pet> {
  // final _apparentHealth = ref.watch(apparentHealthProvider);
  // var _actualHealth = 0;

  // void _refreshHealth = 0;

  @override
  Widget build(BuildContext context) {
    final apparentHealth = ref.watch(apparentHealthProvider);

    // final actualHealth = ref.watch(actualHealthProvider);

    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 250,
          child: Column(
            children: [
              HeartBar(apparentHealth),
              Text('actual health: ${widget.actualHealth}'),
              const FrameChanger(),
              Image.asset('assets/images/worm1.png', width: 200),
            ],
          ),
        ),
      ],
    );
  }
}
