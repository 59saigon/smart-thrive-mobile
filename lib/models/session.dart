import 'package:smart_thrive_mobile/models/course.dart';

class Session {
  String courseId;
  String sessionName;
  String? title;
  String? description;
  DateTime? learnDate;
  Course? course;

  Session({
    required this.courseId,
    required this.sessionName,
    this.title,
    this.description,
    this.learnDate,
    this.course,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      courseId: json['courseId'],
      sessionName: json['sessionName'],
      title: json['title'],
      description: json['description'],
      learnDate:
          json['learnDate'] != null ? DateTime.parse(json['learnDate']) : null,
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
    );
  }
}
