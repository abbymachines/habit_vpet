import 'package:flutter/material.dart';
import 'package:habit_vpet/styled_text.dart';
import 'package:habit_vpet/widgets/pet/pet_feeder.dart';
import 'package:habit_vpet/widgets/screens/start_screen.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';
import 'package:habit_vpet/widgets/new_habit.dart';

class HabitVpet extends StatefulWidget {
  const HabitVpet({super.key});

  @override
  State<HabitVpet> createState() {
    return _HabitVpetState();
  }
}

class _HabitVpetState extends State<HabitVpet> {
  final List<Habit> _myHabits = [
    Habit(
      'its like going on a walk but with your cat',
      title: 'Walk the cat',
      frequency: 'every day',
      habitColor: Colors.red,
      isComplete: false,
    ),
    Habit(
      'you always have homework',
      title: 'Homework',
      frequency: 'every weekday',
      habitColor: Colors.yellow,
      isComplete: true,
    ),
    Habit(
      'dont forget to exercise ❣️',
      title: 'Exercise',
      frequency: 'once a week',
      habitColor: Colors.blue,
      isComplete: false,
    ),
    Habit(
      'a filthy room is a filthy mind',
      title: 'Clean your room',
      frequency: 'twice a week',
      habitColor: Colors.blue,
      isComplete: true,
    ),
    Habit(
      'oink oink oink oink oink',
      title: 'Play with Piggy :)',
      frequency: 'every day',
      habitColor: Colors.red,
      isComplete: true,
    ),
    Habit(
      'dont get it stinky!',
      title: 'Take out trash',
      frequency: 'once every five days',
      habitColor: Colors.blue,
      isComplete: false,
    ),
    Habit(
      'mmmm ice cream so good',
      title: 'Stream',
      frequency: 'five times a week',
      habitColor: Colors.yellow,
      isComplete: false,
    ),
    Habit(
      'do it for piggy',
      title: 'Clean litterbox',
      frequency: 'every day',
      habitColor: Colors.red,
      isComplete: false,
    ),
  ];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'habits-screen';
    });
  }

  void _openAddHabitOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewHabit(onAddHabit: _addHabit),
    );
  }

  void _addHabit(Habit habit) {
    setState(() {
      _myHabits.add(habit);
    });
  }

  void _removeHabit(Habit habit) {
    setState(() {
      _myHabits.remove(habit);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget screenWidget = StartScreen(switchScreen);

    return Scaffold(
      appBar: AppBar(
        title: const Text('habit vpet'),
        actions: [
          IconButton(
            onPressed: _openAddHabitOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 19, 52, 5),
              Color.fromARGB(255, 209, 243, 17),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const StyledText('thine worm is a contented worm'),
            const SizedBox(height: 20),
            const Center(
              child: PetFeeder(),
            ),
            const SizedBox(height: 30),
            Expanded(
              flex: 5,
              child: HabitList(
                habits: _myHabits,
                onRemoveHabit: _removeHabit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
