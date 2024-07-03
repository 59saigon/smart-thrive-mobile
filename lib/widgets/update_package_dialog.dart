import 'package:flutter/material.dart';

class UpdatePackageDialog extends StatelessWidget {
  final String title;
  final String actionButtonText;
  final VoidCallback onActionButtonPressed;

  const UpdatePackageDialog({
    Key? key,
    required this.title,
    required this.actionButtonText,
    required this.onActionButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
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
          onPressed: onActionButtonPressed,
          child: Text(actionButtonText),
        ),
      ],
    );
  }
}
