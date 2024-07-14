import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/course.dart';

class Session extends BaseEntity {
  String courseId;
  String sessionName;
  String? title;
  String? description;
  DateTime? learnDate;
  Course? course;

  Session({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.courseId,
    required this.sessionName,
    this.title,
    this.description,
    this.learnDate,
    this.course,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      courseId: json['courseId'],
      sessionName: json['sessionName'],
      title: json['title'],
      description: json['description'],
      learnDate:
          json['learnDate'] != null ? DateTime.parse(json['learnDate']) : null,
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdBy': createdBy,
      'createdDate': createdDate.toIso8601String(),
      'lastUpdatedBy': lastUpdatedBy,
      'lastUpdatedDate': lastUpdatedDate?.toIso8601String(),
      'isDeleted': isDeleted,
      'courseId': courseId,
      'sessionName': sessionName,
      'title': title,
      'description': description,
      'learnDate': learnDate?.toIso8601String(),
      'course': course?.toJson(),
    };
  }
}
