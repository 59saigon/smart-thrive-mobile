import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/models/user.dart';

class Provider extends BaseEntity {
  String userId;
  String companyName;
  String website;
  User? user;
  List<Course>? courses;

  Provider({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.userId,
    required this.companyName,
    required this.website,
    this.user,
    this.courses,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      userId: json['userId'],
      companyName: json['companyName'],
      website: json['website'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
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
      'userId': userId,
      'companyName': companyName,
      'website': website,
      'user': user?.toJson(),
      'courses': courses != null
          ? courses!.map((model) => model.toJson()).toList()
          : null,
    };
  }
}
