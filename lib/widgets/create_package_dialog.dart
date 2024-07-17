import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class CreatePackageDialog extends StatefulWidget {
  final String studentId;
  final VoidCallback refreshCallback;

  const CreatePackageDialog(
      {super.key, required this.studentId, required this.refreshCallback});

  @override
  _CreatePackageDialogState createState() => _CreatePackageDialogState();
}

class _CreatePackageDialogState extends State<CreatePackageDialog> {
  final TextEditingController _packageNameController = TextEditingController();
  final TextEditingController _quantityCourseController =
      TextEditingController();

  @override
  void dispose() {
    _packageNameController.dispose();
    _quantityCourseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Package'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _packageNameController,
              decoration: const InputDecoration(labelText: 'Package Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _quantityCourseController,
              decoration: const InputDecoration(labelText: 'Quantity Course'),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            _createPackage();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }

  Future<void> _createPackage() async {
    try {
      Map<String, dynamic> requestBody = {
        "studentId": widget.studentId,
        "packageName": _packageNameController.text,
        "quantityCourse": int.parse(_quantityCourseController.text),
        "startDate": DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
        "endDate": DateFormat('yyyy-MM-ddTHH:mm:ss')
            .format(DateTime.now().add(const Duration(days: 30))),
        "totalPrice": 0,
        "isActive": true,
        "createdBy": "string",
        "createdDate": DateTime.now().toIso8601String(),
        "lastUpdatedBy": "string",
        "lastUpdatedDate": DateTime.now().toIso8601String(),
        "isDeleted": false
      };

      await APIService.createPackage(requestBody);

      Navigator.of(context).pop();

      widget.refreshCallback();
    } catch (e) {
      print('Failed to create package: $e');
    }
  }
}
