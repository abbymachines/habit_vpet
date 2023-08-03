import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';

class NewHabit extends StatefulWidget {
  const NewHabit({super.key, required this.onAddHabit});

  final void Function(Habit habit) onAddHabit;

  @override
  State<StatefulWidget> createState() {
    return _NewHabitState();
  }
}

class _NewHabitState extends State<NewHabit> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _frequencyController = TextEditingController();
  // final _habitColorController = TextEditingController();
  final _isComplete = false;

  void _toggleCompletion() {
    // set state for button here maybe?
  }

  void _submitHabitData() {
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
      ),
    );
    Navigator.pop(context);
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
          ),
          const Row(
            children: [
              Text('put a color picker here maybe'),
              Text('put a toggle button here methinks')
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('put something else here too maybe'),
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
