import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NewHabit extends StatefulWidget {
  const NewHabit({super.key, required this.onAddHabit});

  final void Function(Habit habit) onAddHabit;

  @override
  State<NewHabit> createState() {
    return _NewHabitState();
  }
}

class _NewHabitState extends State<NewHabit> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _frequencyController = TextEditingController();
  // final _habitColorController = TextEditingController();
  final _isComplete = false;
  // final _isGoalMet = false;

  void _submitHabitData() async {
    if (_titleController.text.trim().isEmpty ||
        _frequencyController.text.trim().isEmpty) {
      // || _habitColorController.cpo.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure to add a valid title, description, and habit color.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddHabit(
      Habit(
        _descriptionController.text,
        title: _titleController.text,
        frequency: _frequencyController.text,
        habitColor: Colors.red,
        isComplete: _isComplete,
        // isGoalMet: _isGoalMet
      ),
    );
    // Navigator.pop(context);

    final url =
        Uri.https('habit-vpet-default-rtdb.firebaseio.com', 'habit-vpet.json');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'title': _titleController.text,
          'description': _descriptionController.text,
          'frequency': _frequencyController.text,
          'habit color': Colors.red.toString(),
          'isComplete': _isComplete,
        },
      ),
    );

    print('------------');
    print('the response body:');
    print(response.body);
    print('------------');
    print('the response status code:');
    print(response.statusCode);
    print('------------');

    if (!context.mounted) {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('title'),
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 100,
            decoration: const InputDecoration(
              label: Text('description'),
            ),
          ),
          TextField(
            controller: _frequencyController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('frequency'),
            ),
          ),
          const Row(
            children: [
              Text('🖍️'), // color picker
              Text('☑️') // toggle completion button
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('♣️'), // something else maybe
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitHabitData,
                child: const Text('Save Habit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
