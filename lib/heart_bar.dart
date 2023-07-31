import 'package:flutter/material.dart';
import 'package:habit_vpet/heart.dart';

const fullHeart = '❤️';
const halfHeart = '❤️‍🩹';
const emptyHeart = '♡';

class HeartBar extends StatefulWidget {
  const HeartBar({
    required this.completedHabits,
    required this.totalHabits,
    super.key,
  });

  final int completedHabits;
  final int totalHabits;

  @override
  State<HeartBar> createState() {
    return _HeartBarState();
  }
}

class _HeartBarState extends State<HeartBar> {
  var health = 8;
  // the heart range is 0-8
  final heartBarStates = {
    0: emptyHeart,
    1: halfHeart,
    2: fullHeart,
    3: fullHeart + halfHeart,
    4: fullHeart + fullHeart,
    5: fullHeart + fullHeart + halfHeart,
    6: fullHeart + fullHeart + fullHeart,
    7: fullHeart + fullHeart + fullHeart + halfHeart,
    8: fullHeart + fullHeart + fullHeart + fullHeart,
  };

  void setHealth() {
    setState(() {
      health = ((widget.completedHabits / widget.totalHabits) * 8).floor();
    });
  }

  @override
  Widget build(context) {
    final hearts = heartBarStates[3];

    return Container(
      alignment: Alignment.center,
      child: Text(
        hearts!,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}



//   @override
//   Widget build(context) {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Heart(fullHeart),
//         Heart(fullHeart),
//         Heart(fullHeart),
//         Heart(emptyHeart),
//       ],
//     );
//   }
// }
