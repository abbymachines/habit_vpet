import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/data/dummy_data.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';

final habitsProvider = Provider((ref) {
  return const HabitList();
});
