import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/models/package.dart';

class CourseXPackage {
  final String courseId;
  final String packageId;
  final Course? course;
  final Package? package;

  CourseXPackage({
    required this.courseId,
    required this.packageId,
    this.course,
    this.package,
  });

  factory CourseXPackage.fromJson(Map<String, dynamic> json) {
    return CourseXPackage(
      courseId: json['courseId'],
      packageId: json['packageId'],
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
      package:
          json['package'] != null ? Package.fromJson(json['package']) : null,
    );
  }
}
