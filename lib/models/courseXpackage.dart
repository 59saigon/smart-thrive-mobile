import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/models/package.dart';

class CourseXPackage extends BaseEntity {
  String courseId;
  String packageId;
  Course? course;
  Package? package;

  CourseXPackage({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.courseId,
    required this.packageId,
    this.course,
    this.package,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory CourseXPackage.fromJson(Map<String, dynamic> json) {
    return CourseXPackage(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      courseId: json['courseId'],
      packageId: json['packageId'],
      course: json['course'] != null ? Course.fromJson(json['course']) : null,
      package:
          json['package'] != null ? Package.fromJson(json['package']) : null,
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
      'packageId': packageId,
      'course': course?.toJson(),
      'package': package?.toJson(),
    };
  }
}
