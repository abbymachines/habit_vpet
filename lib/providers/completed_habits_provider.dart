import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/models/habit.dart';

class CompletedHabitsNotifier extends StateNotifier<List<Habit>> {
  CompletedHabitsNotifier() : super([]);

  void toggleHabitCompletionStatus(Habit habit) {
    final habitIsComplete = state.contains(habit);

    if (habitIsComplete) {
      state = state.where((h) => h.id != habit.id).toList();
    } else {
      state = [...state, habit];
    }
  }
}

final completedHabitsProvider =
    StateNotifierProvider<CompletedHabitsNotifier, List<Habit>>((ref) {
  return CompletedHabitsNotifier();
});