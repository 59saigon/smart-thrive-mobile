import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/subject.dart';

class Category extends BaseEntity {
  String categoryName;
  List<Subject>? subjects;
  String thumbnail;

  Category({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.categoryName,
    this.subjects,
    required this.thumbnail,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      categoryName: json['categoryName'],
      subjects: json['subjects'] != null
          ? List<Subject>.from(
              json['subjects'].map((model) => Subject.fromJson(model)))
          : null,
      thumbnail: 'assets/icons/design.jpg',
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
      'categoryName': categoryName,
      'subjects': subjects != null
          ? subjects!.map((model) => model.toJson()).toList()
          : null,
    };
  }
}
