import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/constants/size.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/screens/course_screen.dart';

class PackageCard extends StatelessWidget {
  final Package package;

  const PackageCard({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseScreen(
            packageId: package.id,
          ),
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
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      package.thumbnail,
                      height: kPackageCardImageSize,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  package.packageName,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  '${package.quantityCourse} courses',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xff8a72f1), // Purple color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '\$${package.totalPrice.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
