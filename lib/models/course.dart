import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/courseXpackage.dart';
import 'package:smart_thrive_mobile/models/provider.dart';
import 'package:smart_thrive_mobile/models/session.dart';
import 'package:smart_thrive_mobile/models/subject.dart';

class Course extends BaseEntity {
  String? subjectId;
  String? providerId;
  String? address;
  String? code;
  String? courseName;
  String? description;
  double? price;
  int? soldCourses;
  int? totalSlots;
  int? totalSessions;
  bool? isApproved;
  bool? isActive;
  DateTime? startDate;
  DateTime? endDate;
  Subject? subject;
  Provider? provider;
  List<Session>? sessions;
  List<CourseXPackage>? courseXPackages;
  String thumbnail;

  Course({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    this.subjectId,
    this.providerId,
    this.address,
    this.code,
    this.courseName,
    this.description,
    this.price,
    this.soldCourses,
    this.totalSlots,
    this.totalSessions,
    this.isApproved,
    this.isActive,
    this.startDate,
    this.endDate,
    this.subject,
    this.provider,
    this.sessions,
    this.courseXPackages,
    required this.thumbnail,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      subjectId: json['subjectId'],
      providerId: json['providerId'],
      address: json['address'],
      code: json['code'],
      courseName: json['courseName'],
      description: json['description'],
      price: json['price'],
      soldCourses: json['soldCourses'],
      totalSlots: json['totalSlots'],
      totalSessions: json['totalSessions'],
      isApproved: json['isApproved'],
      isActive: json['isActive'],
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      subject:
          json['subject'] != null ? Subject.fromJson(json['subject']) : null,
      provider:
          json['provider'] != null ? Provider.fromJson(json['provider']) : null,
      sessions: json['sessions'] != null
          ? List<Session>.from(
              json['sessions'].map((model) => Session.fromJson(model)))
          : null,
      courseXPackages: json['courseXPackages'] != null
          ? List<CourseXPackage>.from(json['courseXPackages']
              .map((model) => CourseXPackage.fromJson(model)))
          : null,
      thumbnail: 'assets/icons/water_fun_icon.jpg',
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
      'subjectId': subjectId,
      'providerId': providerId,
      'address': address,
      'code': code,
      'courseName': courseName,
      'description': description,
      'price': price,
      'soldCourses': soldCourses,
      'totalSlots': totalSlots,
      'totalSessions': totalSessions,
      'isApproved': isApproved,
      'isActive': isActive,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'subject': subject?.toJson(),
      'provider': provider?.toJson(),
      'sessions': sessions != null
          ? sessions!.map((model) => model.toJson()).toList()
          : null,
      'courseXPackages': courseXPackages != null
          ? courseXPackages!.map((model) => model.toJson()).toList()
          : null,
    };
  }
}
