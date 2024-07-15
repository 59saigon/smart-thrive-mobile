import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/widgets/course_card.dart';
import 'package:smart_thrive_mobile/widgets/custom_icon_button.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class AllCourseScreen extends StatefulWidget {
  final String studentId; // Add studentId parameter

  const AllCourseScreen({Key? key, required this.studentId})
      : super(key: key); // Include studentId in constructor

  @override
  _AllCourseScreenState createState() => _AllCourseScreenState();
}

class _AllCourseScreenState extends State<AllCourseScreen> {
  List<Course> courseList = [];

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    try {
      List<Course> fetchedCourses = await APIService.getCourses();
      setState(() {
        courseList = fetchedCourses;
      });
    } catch (e) {
      print('Failed to fetch courses: $e');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'All Courses',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          child: const Icon(Icons.arrow_back),
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        course: courseList[index],
                        studentId:
                            widget.studentId, // Pass studentId to CourseCard
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
