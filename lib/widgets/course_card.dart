import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/constants/size.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/screens/details_screen.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(course: course),
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
                  course.courseName ?? 'No Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Provider: ${course.provider}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //     decoration: BoxDecoration(
            //       color: const Color(0xff8a72f1),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Text(
            //       '\$${course.price?.toStringAsFixed(0)}',
            //       style: const TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
