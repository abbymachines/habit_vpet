import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class ApparentHealthNotifier extends StateNotifier<int> {
  ApparentHealthNotifier() : super(0);

  void incrementApparentHealth(int health) {
    if (health == 4) {
      state = 4;
    } else {
      state = (health += 1);
    }
  }

  void decrementApparentHealth(int health) {
    if (health > 0) {
      state = (health -= 1);
    }
  }
}

final healthProvider =
    StateNotifierProvider<ApparentHealthNotifier, int>((ref) {
  return ApparentHealthNotifier();
});
