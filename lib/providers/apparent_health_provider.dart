import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'dart:async';

class ApparentHealthNotifier extends StateNotifier<int> {
  ApparentHealthNotifier() : super(0);

  void incrementApparentHealth(int apparentHealth) {
    if (apparentHealth == 4) {
      state = 4;
    } else {
      state = (apparentHealth += 1);
    }
  }

  void decrementApparentHealth(int apparentHealth, int actualHealth) {
    if (apparentHealth > actualHealth) {
      state = (apparentHealth -= 1);
    }
  }
}

final apparentHealthProvider =
    StateNotifierProvider<ApparentHealthNotifier, int>((ref) {
  return ApparentHealthNotifier();
});
