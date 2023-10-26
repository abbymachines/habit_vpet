import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit_vpet/widgets/pet/pet.dart';

final healthProvider = Provider<int>((_) => 100);

// 1. extend [ConsumerStatefulWidget]
class PetWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<PetWidget> createState() => _PetState();
}

// 2. extend [ConsumerState]
class _PetState extends ConsumerState<PetWidget> {
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    final health = ref.read(healthProvider);
    print(health); // "Hello world"
  }

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final health = ref.watch(healthProvider);
    return Text(health.toString());
  }
}

// 1. widget class now extends [ConsumerWidget]
// class PetWidget extends ConsumerWidget {
//   @override
//   // 2. build method has an extra [WidgetRef] argument
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 3. use ref.watch() to get the value of the provider
//     final health = ref.watch(healthProvider);
//     return Pet(health: health);
//   }
// }
