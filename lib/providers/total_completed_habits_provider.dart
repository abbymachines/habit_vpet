import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/providers/completed_habits_provider.dart';

final totalCompletedHabitsProvider = Provider((ref) {
  int length = ref.watch(completedHabitsProvider).length;

  return length;
});
