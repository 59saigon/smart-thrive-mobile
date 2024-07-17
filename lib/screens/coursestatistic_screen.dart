import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class CourseStatisticScreen extends StatefulWidget {
  const CourseStatisticScreen({super.key});

  @override
  _CourseStatisticScreenState createState() => _CourseStatisticScreenState();
}

class _CourseStatisticScreenState extends State<CourseStatisticScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Statistic'),
      ),
      body: ListView.builder(
        itemCount: courseList.length,
        itemBuilder: (context, index) {
          final course = courseList[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('${course.courseName}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject: ${course.isActive}'),
                  Text('CourseId: ${course.code}'),
                  Text('Description: ${course.description}'),
                  Text('Price: ${course.price}'),
                  Text('IsActive: ${course.isActive}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
