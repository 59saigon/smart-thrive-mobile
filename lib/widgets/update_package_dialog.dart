import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class UpdatePackageDialog extends StatefulWidget {
  final String studentId;
  final String id;
  final String packageName;
  final int quantityCourse;
  final VoidCallback onUpdateSuccess;

  const UpdatePackageDialog({
    Key? key,
    required this.id,
    required this.packageName,
    required this.quantityCourse,
    required this.onUpdateSuccess,
    required this.studentId,
  }) : super(key: key);

  @override
  _UpdatePackageDialogState createState() => _UpdatePackageDialogState();
}

class _UpdatePackageDialogState extends State<UpdatePackageDialog> {
  late TextEditingController _packageNameController;
  late TextEditingController _quantityCourseController;

  @override
  void initState() {
    super.initState();
    _packageNameController = TextEditingController(text: widget.packageName);
    _quantityCourseController =
        TextEditingController(text: widget.quantityCourse.toString());
  }

  @override
  void dispose() {
    _packageNameController.dispose();
    _quantityCourseController.dispose();
    super.dispose();
  }

  void _confirmUpdate() async {
    try {
      await APIService.updatePackage({
        "id": widget.id,
        "studentId": widget.studentId,
        "packageName": _packageNameController.text,
        "startDate": DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
        "endDate": DateFormat('yyyy-MM-ddTHH:mm:ss')
            .format(DateTime.now().add(Duration(days: 30))),
        "quantityCourse": int.parse(_quantityCourseController.text),
        "totalPrice": 0,
        "isActive": true,
        "createdBy": "string",
        "createdDate": DateTime.now().toIso8601String(),
        "lastUpdatedBy": "string",
        "lastUpdatedDate": DateTime.now().toIso8601String(),
        "isDeleted": false
      });
      widget.onUpdateSuccess();
      Navigator.of(context).pop();
      _showSuccessDialog(context); // Show success dialog
    } catch (e) {
      print('Failed to update package: $e');
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Package updated successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _updatePackage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Update'),
          content: const Text('Are you sure you want to update this package?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _confirmUpdate();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Update Package'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _packageNameController,
            decoration: const InputDecoration(labelText: 'Package Name'),
          ),
          TextField(
            controller: _quantityCourseController,
            decoration: const InputDecoration(labelText: 'Quantity Course'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _updatePackage,
          child: const Text('Update'),
        ),
      ],
    );
  }
}
