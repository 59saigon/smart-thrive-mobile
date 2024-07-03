import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/screens/course_screen.dart';
import 'package:smart_thrive_mobile/widgets/update_package_dialog.dart';

class PackageContainer extends StatelessWidget {
  final String studentId;
  final Package package;
  final VoidCallback onUpdateSuccess;

  const PackageContainer(
      {Key? key,
      required this.package,
      required this.studentId,
      required this.onUpdateSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseScreen(),
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
                        quantityCourse: package.quantityCourse,
                        studentId: studentId,
                        onUpdateSuccess: onUpdateSuccess,
                      );
                    },
                  );
                } else if (result == 'delete') {}
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
