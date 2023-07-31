import 'package:flutter/material.dart';
// import 'package:habit_vpet/heart.dart';

const fullHeart = '❤️';
const halfHeart = '❤️‍🩹';
const emptyHeart = '♡';

class HeartBar extends StatefulWidget {
  const HeartBar({
    super.key,
    required this.health,
  });

  final int health;
  // final int totalHabits;
  final heartBarStates = const {
    0: emptyHeart,
    1: fullHeart,
    2: fullHeart + fullHeart,
    3: fullHeart + fullHeart + fullHeart,
    4: fullHeart + fullHeart + fullHeart + fullHeart,
    // 5: ,
    // 6: ,
    // 7: ,
    // 8: ,
  };

  @override
  State<HeartBar> createState() {
    return _HeartBarState();
  }
}

class _HeartBarState extends State<HeartBar> {
  var hearts = 2;

  void setHealth() {
    setState(() {
      hearts = widget.health * 1;
    });
  }

  @override
  Widget build(context) {
    final heartBar = widget.heartBarStates[hearts];

    return Container(
      alignment: Alignment.center,
      child: Text(
        heartBar!,
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
