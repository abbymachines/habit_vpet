// import 'package:flutter/material.dart';
// import 'package:habit_vpet/models/habit.dart';

// class HabitCompleter extends StatefulWidget {
//   const HabitCompleter({required this.habit, super.key});

//   final Habit habit;

//   @override
//   State<StatefulWidget> createState() {
//     return _HabitCompleterState();
//   }
// }

// class _HabitCompleterState extends State<HabitCompleter> {
//   var currentIsComplete = false;
//   var currentIsGoalMet = false;

//   void _completeHabit() {
//     setState(() {
//       currentIsComplete = !currentIsComplete;
//       currentIsGoalMet = !currentIsGoalMet;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton.icon(
//       onPressed: _completeHabit,
//       icon: const Icon(Icons.copyright),
//       label: Text(
//         currentIsComplete.toString(),
//       ),
//     );
//   }
// }
