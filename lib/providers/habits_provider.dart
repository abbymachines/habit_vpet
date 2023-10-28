import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/data/dummy_data.dart';
import 'package:habit_vpet/models/habit.dart';

class HabitsNotifier extends StateNotifier<List<Habit>> {
  HabitsNotifier() : super(dummyHabits);

  void addHabit(Habit habit) {
    state.add(habit);
  }
}

final habitsProvider =
    StateNotifierProvider<HabitsNotifier, List<Habit>>((ref) {
  return HabitsNotifier();
});
