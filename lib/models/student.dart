import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/models/user.dart';

class Student extends BaseEntity {
  String userId;
  String? studentName;
  String? gender;
  DateTime? dob;
  User? user;
  List<Package>? packages;

  Student({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.userId,
    this.studentName,
    this.gender,
    this.dob,
    this.user,
    this.packages,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      userId: json['userId'],
      studentName: json['studentName'],
      gender: json['gender'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      packages: json['packages'] != null
          ? List<Package>.from(
              json['packages'].map((model) => Package.fromJson(model)))
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
      'studentName': studentName,
      'gender': gender,
      'dob': dob?.toIso8601String(),
      'user': user?.toJson(),
      'packages': packages != null
          ? packages!.map((model) => model.toJson()).toList()
          : null,
    };
  }
}
