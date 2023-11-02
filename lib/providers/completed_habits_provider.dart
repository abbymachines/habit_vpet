import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:habit_vpet/models/habit.dart';

class CompletedHabitsNotifier extends StateNotifier<List<Habit>> {
  CompletedHabitsNotifier() : super([]);

  void buildCompletedHabitsList(Habit habit) {
    if (habit.isComplete) {
      state = state.where((h) => h.id != habit.id).toList();
    } else {
      state = [...state, habit];
    }
  }

  int returnCompletedHabitsLength() {
    return state.length;
  }
}

final completedHabitsProvider = StateNotifierProvider((ref) {
  return CompletedHabitsNotifier();
});
