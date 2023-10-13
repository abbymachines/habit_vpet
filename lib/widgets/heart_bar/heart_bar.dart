import 'package:flutter/material.dart';
import 'package:habit_vpet/data/dummy_data.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';

const fullHeart = '🤣';
const halfHeart = '❤️‍🩹';
const emptyHeart = '♡';

final heartBarStates = {
  0: emptyHeart,
  1: fullHeart,
  2: fullHeart + fullHeart,
  3: fullHeart + fullHeart + fullHeart,
  4: fullHeart + fullHeart + fullHeart + fullHeart,
  5: fullHeart,
};

class HeartBar extends StatelessWidget {
  const HeartBar(this.health, {super.key});

  final int health;

  @override
  Widget build(context) {
    print('the health is now $health');
    print(habits)

    return SizedBox(
      width: 300,
      height: 40,
      child: Container(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              heartBarStates[health]!,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              health.toString(),
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
