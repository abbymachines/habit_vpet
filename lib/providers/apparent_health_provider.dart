import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:habit_vpet/providers/actual_health_provider.dart';

class ApparentHealthNotifier extends StateNotifier<int> {
  ApparentHealthNotifier() : super(0);

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

final apparentHealthProvider =
    StateNotifierProvider<ApparentHealthNotifier, int>((ref) {
  return ApparentHealthNotifier();
});
