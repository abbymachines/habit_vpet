// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:habit_vpet/models/habit.dart';
// import 'package:habit_vpet/widgets/habit_list/habit_list.dart';

// class CompletedHabitsNotifier extends StateNotifier<List<Habit>> {
//   CompletedHabitsNotifier() : super([]);

//   bool toggleHabitCompletionStatus(Habit habit) {
//     final habitIsComplete = state.contains(habit);

//     if (habitIsComplete) {
//       state = state
//           .where((h) => h.id != habit.id)
//           .toList(); // removes it from the list?
//       return false; // toggles habit to incomplete
//       // put a patch request here. probably use an
//       // async/await
//     } else {
//       state = [...state, habit]; // adds it to the list?
//       return true; // toggles habit to complete?
//       // likewise put a patch request here as well
//     }
//   }

//   bool setHabitCompletionToFalse(Habit habit) {
//     // final habitIsComplete = state.contains(habit);
//     return false;
//   }

//   // int returnLength(HabitList habits) {
//   //   CompletedHabitsNotifier.length
//   // }
// }

// final completedHabitsProvider =
//     StateNotifierProvider<CompletedHabitsNotifier, List<Habit>>((ref) {
//   return CompletedHabitsNotifier();
// });
