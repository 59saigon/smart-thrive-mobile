import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/category.dart';
import 'package:smart_thrive_mobile/models/course.dart';

class Subject extends BaseEntity {
  String subjectName;
  String? categoryId;
  Category? category;
  List<Course>? courses;

  Subject({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.subjectName,
    this.categoryId,
    this.category,
    this.courses,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      subjectName: json['subjectName'],
      categoryId: json['categoryId'],
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      courses: json['courses'] != null
          ? List<Course>.from(
              json['courses'].map((model) => Course.fromJson(model)))
          : null,
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
      'subjectName': subjectName,
      'categoryId': categoryId,
      'category': category?.toJson(),
      'courses': courses != null
          ? courses!.map((model) => model.toJson()).toList()
          : null,
    };
  }
}
