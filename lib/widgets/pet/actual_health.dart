// import 'package:flutter/material.dart';
// import 'package:habit_vpet/providers/completed_habits_provider.dart';
// import 'package:habit_vpet/providers/habits_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ActualHealth extends ConsumerStatefulWidget {
//   const ActualHealth({super.key});

//   @override
//   ConsumerState<ActualHealth> createState() => _ActualHealthState();
// }

// class _ActualHealthState extends ConsumerState<ActualHealth> {
//   int _actualHealth = 0;

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     var _habitsLength = ref.read(habitsProvider.notifier).returnHabitsLength();

//     var _completedHabitsLength = ref
//         .read(completedHabitsProvider.notifier)
//         .returnCompletedHabitsLength();

//     var _actualHealth = ((_completedHabitsLength / _habitsLength) * 4).floor();

//     return Text(_actualHealth.toString());
//   }
// }
