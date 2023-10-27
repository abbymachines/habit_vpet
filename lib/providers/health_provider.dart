import 'package:flutter_riverpod/flutter_riverpod.dart';

class HealthNotifier extends StateNotifier<int> {
  HealthNotifier() : super(0);

  void incrementHealth(int health) {
    if (health == 4) {
      state = 4;
    } else {
      state = (health += 1);
    }
  }
}

final healthProvider = StateNotifierProvider<HealthNotifier, int>((ref) {
  return HealthNotifier();
});
