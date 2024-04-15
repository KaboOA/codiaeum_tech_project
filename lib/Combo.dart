import 'package:flutter/material.dart';

class Combo extends StatelessWidget {
  // Define a list of items for the combo box
  const Combo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combo Box Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownButton<String>(
            // Define the dropdown button
            value: items[0], // Initial value (set to the first item)
            onChanged: (String? newValue) {
              // Handle when an item is selected
              print('Selected: $newValue');
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              // Create dropdown menu items from the list of items
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
