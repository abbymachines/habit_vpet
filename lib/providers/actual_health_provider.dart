import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class HealthNotifier extends StateNotifier<int> {
  HealthNotifier() : super(0);

  void incrementHealth(int health) {
    if (health == 4) {
      state = 4;
    } else {
      state = (health += 1);
    }
  }

  void decrementHealth(int health) {
    if (health > 0) {
      state = (health -= 1);
    }
  }

  void startCountdown(health) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      decrementHealth(health);
    });
  }
}

final healthProvider = StateNotifierProvider<HealthNotifier, int>((ref) {
  return HealthNotifier();
});
