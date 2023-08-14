import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/models/habit.dart';

class CompletedHabitsNotifier extends StateNotifier<List<Habit>> {
  CompletedHabitsNotifier() : super([]);

  bool toggleHabitCompletionStatus(Habit habit) {
    final habitIsComplete = state.contains(habit);

    if (habitIsComplete) {
      state = state
          .where((h) => h.id != habit.id)
          .toList(); // removes it from the list?
      return false; // toggles habit to incomplete
    } else {
      state = [...state, habit]; // adds it to the list?
      return true; // toggles habit to complete?
    }
  }
}

final completedHabitsProvider =
    StateNotifierProvider<CompletedHabitsNotifier, List<Habit>>((ref) {
  return CompletedHabitsNotifier();
});
