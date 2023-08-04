import 'package:flutter/material.dart';
import 'package:habit_vpet/pet_status_message.dart';
import 'package:habit_vpet/widgets/pet/pet_feeder.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_list.dart';
import 'package:habit_vpet/widgets/new_habit.dart';
import 'package:habit_vpet/widgets/pet/frame_changer.dart';

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
      isGoalMet: false,
    ),
    Habit(
      'you always have homework',
      title: 'Homework',
      frequency: 'every weekday',
      habitColor: Colors.yellow,
      isComplete: true,
      isGoalMet: true,
    ),
    Habit(
      'dont forget to exercise ❣️',
      title: 'Exercise',
      frequency: 'once a week',
      habitColor: Colors.blue,
      isComplete: false,
      isGoalMet: true,
    ),
    Habit(
      'a filthy room is a filthy mind',
      title: 'Clean your room',
      frequency: 'twice a week',
      habitColor: Colors.blue,
      isComplete: true,
      isGoalMet: true,
    ),
    Habit(
      'oink oink oink oink oink',
      title: 'Play with Piggy :)',
      frequency: 'every day',
      habitColor: Colors.red,
      isComplete: true,
      isGoalMet: true,
    ),
    Habit(
      'dont get it stinky!',
      title: 'Take out trash',
      frequency: 'once every five days',
      habitColor: Colors.blue,
      isComplete: false,
      isGoalMet: false,
    ),
    Habit(
      'mmmm ice cream so good',
      title: 'Stream',
      frequency: 'five times a week',
      habitColor: Colors.yellow,
      isComplete: false,
      isGoalMet: false,
    ),
    Habit(
      'do it for piggy',
      title: 'Clean litterbox',
      frequency: 'every day',
      habitColor: Colors.red,
      isComplete: false,
      isGoalMet: false,
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
    final habitIndex = _myHabits.indexOf(habit);
    setState(() {
      _myHabits.remove(habit);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Habit deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _myHabits.insert(habitIndex, habit);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget habitContent = const Center(
      child: Text('No habits found. Start adding some!'),
    );

    if (_myHabits.isNotEmpty) {
      habitContent = HabitList(
        habits: _myHabits,
        onRemoveHabit: _removeHabit,
      );
    }

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
            const PetStatusMessage('thine worm is a contented worm'),
            const SizedBox(height: 20),
            const Center(
              child: PetFeeder(),
            ),
            const Center(
              child: FrameChanger(),
            ),
            const SizedBox(height: 30),
            Expanded(
              flex: 5,
              child: habitContent,
            ),
          ],
        ),
      ),
    );
  }
}
