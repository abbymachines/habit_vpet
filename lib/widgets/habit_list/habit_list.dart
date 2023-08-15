import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:habit_vpet/models/habit.dart';
import 'package:habit_vpet/widgets/habit_list/habit_item.dart';
import 'package:habit_vpet/data/dummy_data.dart';
import 'package:http/http.dart' as http;

class HabitList extends StatefulWidget {
  const HabitList({
    super.key,
    // required this.habits,
    // required this.onRemoveHabit,
  });

  // final List<Habit> habits;
  // final void Function(Habit habit) onRemoveHabit;

  @override
  State<HabitList> createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  List<Habit> _habitItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https('habit-vpet-default-rtdb.firebaseio.com',
        'habit-vpet.json'); // might need to add second argument 'habit-list.json'

    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<Habit> loadedItems = [];
      for (final item in listData.entries) {
        // final category = categories.entries.firstWhere((catItem) => catItem.value.title == item.value['category'],).value;

        loadedItems.add(
          Habit(item.value['description'],
              id: item.key,
              title: item.value['title'],
              frequency: item.value['frequency'],
              habitColor: item.value['habit color'],
              isComplete: item.value['isComplete']),
        );
      }
      setState(() {
        _habitItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }
  }

  void _removeItem(Habit item) async {
    final index = _habitItems.indexOf(item);
    setState(() {
      _habitItems.remove(item);
    });

    final url =
        Uri.https('habit-vpet-default-rtdb.firebaseio.com/${item.id}.json');

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _habitItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_habitItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _habitItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(
            _habitItems[index].id,
          ),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Theme.of(context).colorScheme.error,
          ),
          onDismissed: (direction) {
            _removeItem(_habitItems[index]);
          },
          child: HabitItem(
            _habitItems[index],
          ),
        ),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }

    return content;
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: habits.length,
  //     itemBuilder: (ctx, index) => Dismissible(
  //       key: ValueKey(
  //         habits[index],
  //       ),
  //       direction: DismissDirection.endToStart,
  //       background: Container(
  //         color: Theme.of(context).colorScheme.error,
  //       ),
  //       onDismissed: (direction) {
  //         onRemoveHabit(habits[index]);
  //       },
  //       child: HabitItem(
  //         habits[index],
  //       ),
  //     ),
  //   );
  // }
}
