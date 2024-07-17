import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/constants/size.dart';
import 'package:smart_thrive_mobile/models/category.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/screens/course_screen.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Package package;
  const CategoryCard({super.key, required this.category, required this.package});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(
              packageId: package.id,
            ),
          )),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                category.thumbnail, // Corrected spelling here
                height: kPackageCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.categoryName),
            Text(
              '${category.subjects} subject',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
