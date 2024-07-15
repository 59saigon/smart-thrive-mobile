import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/constants/size.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/screens/details_screen.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final String studentId;

  const CourseCard({Key? key, required this.course, required this.studentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailsScreen(course: course, studentId: studentId),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      course.thumbnail,
                      height: kPackageCardImageSize,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  course.courseName ?? 'Unknown Course',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Code: ${course.code ?? "Unknown"}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
