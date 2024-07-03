import 'package:flutter/material.dart';

class CreatePackageDialog extends StatelessWidget {
  const CreatePackageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Package'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Package Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Quantity Course'),
          ),
          // Add more fields as necessary
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Handle package creation
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
