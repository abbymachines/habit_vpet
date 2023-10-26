import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/widgets/pet/pet.dart';

final healthProvider = Provider<int>((_) => 0);

// 1. widget class now extends [ConsumerWidget]
class PetWidget extends ConsumerWidget {
  @override
  // 2. build method has an extra [WidgetRef] argument
  Widget build(BuildContext context, WidgetRef ref) {
    // 3. use ref.watch() to get the value of the provider
    final health = ref.watch(healthProvider);
    return Pet(health: health);
  }
}
