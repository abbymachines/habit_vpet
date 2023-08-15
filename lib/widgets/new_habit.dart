import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_vpet/widgets/pet/frame_changer.dart';

import 'package:http/http.dart' as http;

import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_item.dart';

class NewHabit extends StatefulWidget {
  const NewHabit({super.key});

  @override
  State<NewHabit> createState() {
    return _NewHabitState();
  }
}

class _NewHabitState extends State<NewHabit> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  var _enteredDescription = '';
  var _enteredFrequency = '';
  // var _enteredHabitColor = Colors.red;
  var _isComplete = false;
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      _formKey.currentState!.save();
      final url = Uri.https(
          'habit-vpet-default-rtdb.firebaseio.com/', 'habit-vpet.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'description': _enteredDescription,
            'title': _enteredTitle,
            'frequency': _enteredFrequency,
            'isComplete': false,
            'habitColor': Colors.red,
          },
        ),
      );

      final Map<String, dynamic> resData = json.decode(response.body);

      if (!context.mounted) {
        return;
      }

      Navigator.of(context).pop(
        Habit(
          _enteredDescription,
          title: _enteredTitle,
          frequency: _enteredFrequency,
          habitColor: Colors.red,
          isComplete: false,
          id: resData['id'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length > 51) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredTitle = value!;
                  },
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Description'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length > 51) {
                      return 'Description must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredDescription = value!;
                  },
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Frequency'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length > 51) {
                      return 'Description must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredFrequency = value!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: const Text('Reset'),
                    ),
                    ElevatedButton(
                      onPressed: _saveItem,
                      child: _isSending
                          ? const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Add Item'),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:habit_vpet/models/habit.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';

// // const uuid = Uuid();

// class NewHabit extends StatefulWidget {
//   const NewHabit({
//     super.key,
//     // required this.onAddHabit,
//   });

//   // final void Function(Habit habit) onAddHabit;

//   @override
//   State<NewHabit> createState() {
//     return _NewHabitState();
//   }
// }

// class _NewHabitState extends State<NewHabit> {
//   final _titleController = TextEditingController();
//   final _descriptionController = TextEditingController();
//   final _frequencyController = TextEditingController();
//   // final _habitColorController = TextEditingController();
//   final _isComplete = false;
//   // final _isGoalMet = false;

//   void _submitHabitData() {
//     if (_titleController.text.trim().isEmpty ||
//         _frequencyController.text.trim().isEmpty) {
//       // || _habitColorController.cpo.trim().isEmpty) {
//       showDialog(
//         context: context,
//         builder: (ctx) => AlertDialog(
//           title: const Text('Invalid input'),
//           content: const Text(
//               'Please make sure to add a valid title, description, and habit color.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(ctx);
//               },
//               child: const Text('Okay'),
//             ),
//           ],
//         ),
//       );
//       return;
//     }

//     // widget.onAddHabit(
//     //   // const uuid = uuid4.v4();

//     //   Habit(
//     //     _descriptionController.text,
//     //     title: _titleController.text,
//     //     frequency: _frequencyController.text,
//     //     habitColor: Colors.red,
//     //     isComplete: _isComplete,
//     //     id: uuid.v4(),
//     //     // isGoalMet: _isGoalMet
//     //   ),
//     // );

//     Navigator.pop(context);

//     final url =
//         Uri.https('habit-vpet-default-rtdb.firebaseio.com', 'habit-vpet.json');
//     http.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: json.encode(
//         {
//           'title': _titleController.text,
//           'description': _descriptionController.text,
//           'frequency': _frequencyController.text,
//           'habit color': Colors.red.toString(),
//           'isComplete': _isComplete,
//         },
//       ),

//       final Map<String, dynamic> resData = json.decode(response.body);

//       if (!context.mounted) {
//         return;
//       }
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
//       child: Column(
//         children: [
//           TextField(
//             controller: _titleController,
//             maxLength: 50,
//             decoration: const InputDecoration(
//               label: Text('title'),
//             ),
//           ),
//           TextField(
//             controller: _descriptionController,
//             maxLength: 100,
//             decoration: const InputDecoration(
//               label: Text('description'),
//             ),
//           ),
//           TextField(
//             controller: _frequencyController,
//             maxLength: 50,
//             decoration: const InputDecoration(
//               label: Text('frequency'),
//             ),
//           ),
//           const Row(
//             children: [
//               Text('🖍️'), // color picker
//               Text('☑️') // toggle completion button
//             ],
//           ),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               const Text('♣️'), // something else maybe
//               const Spacer(),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: _submitHabitData,
//                 child: const Text('Save Habit'),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
