// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:async';

// import 'package:habit_vpet/providers/apparent_health_provider.dart';
// import 'package:habit_vpet/providers/completed_habits_provider.dart';
// import 'package:habit_vpet/providers/habits_provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:habit_vpet/providers/habits_provider.dart';

// class ActualHealthNotifier extends StateNotifier<int> {
//   ActualHealthNotifier() : super(0);

//   // int _completedHabitsLength = 0;
//   // int _totalHabitsLength = 0;

//   void setActualHealth() {
//     completedHabitsLength = ref
//         .read(completedHabitsProvider.notifier)
//         .returnCompletedHabitsLength();

//     _totalHabitsLength = ref.read(habitsProvider.notifier).returnHabitsLength();

//     state = ((_completedHabitsLength / _totalHabitsLength) * 4).floor();
//   }

//   // void incrementApparentHealth(int health) {
//   //   if (health == 4) {
//   //     state = 4;
//   //   } else {
//   //     state = (health += 1);
//   //   }
//   // }

//   // void decrementApparentHealth(int health) {
//   //   if (health > 0) {
//   //     state = (health -= 1);
//   //   }
//   // }
// }

// final actualHealthProvider =
//     StateNotifierProvider<ActualHealthNotifier, int>((ref) {
//   return ActualHealthNotifier();
// });
