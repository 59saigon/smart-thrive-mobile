import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/screens/course_screen.dart';
import 'package:smart_thrive_mobile/widgets/update_package_dialog.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class PackageContainer extends StatelessWidget {
  final String studentId;
  final Package package;
  final VoidCallback onUpdateSuccess;

  const PackageContainer({
    Key? key,
    required this.package,
    required this.studentId,
    required this.onUpdateSuccess,
  }) : super(key: key);

  void _deletePackage(BuildContext context) async {
    bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this package?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      try {
        await APIService.deletePackage(package.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Package deleted successfully'),
          ),
        );
        onUpdateSuccess();
      } catch (e) {
        print('Error deleting package: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete package'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(packageId: package.id),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                package.thumbnail,
                height: 60,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(package.packageName),
                  Text(
                    'Quantity Course: ${package.quantityCourse}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              onSelected: (String result) {
                if (result == 'update') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return UpdatePackageDialog(
                        id: package.id,
                        packageName: package.packageName,
                        quantityCourse: package.quantityCourse ?? 0,
                        studentId: studentId,
                        onUpdateSuccess: onUpdateSuccess,
                      );
                    },
                  );
                } else if (result == 'delete') {
                  _deletePackage(context);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'update',
                  child: Text('Update'),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
