import 'package:smart_thrive_mobile/models/category.dart';
import 'package:smart_thrive_mobile/models/course.dart';

class Subject {
  final String subjectName;
  final String? categoryId;
  final Category? category;
  final List<Course>? courses;

  Subject({
    required this.subjectName,
    this.categoryId,
    this.category,
    this.courses,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    var courseList = json['courses'] as List?;
    List<Course> courseItems = courseList != null
        ? courseList.map((i) => Course.fromJson(i)).toList()
        : [];

    return Subject(
      subjectName: json['subjectName'],
      categoryId: json['categoryId'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      courses: courseItems,
    );
  }
}
