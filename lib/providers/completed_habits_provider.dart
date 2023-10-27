import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/providers/habits_provider.dart';
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
}

final completedHabitsProvider = StateNotifierProvider((ref) {
  return CompletedHabitsNotifier();
});
