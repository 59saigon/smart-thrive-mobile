import 'package:smart_thrive_mobile/models/courseXpackage.dart';
import 'package:smart_thrive_mobile/models/location.dart';
import 'package:smart_thrive_mobile/models/provider.dart';
import 'package:smart_thrive_mobile/models/session.dart';
import 'package:smart_thrive_mobile/models/subject.dart';

class Course {
  String? subjectId;
  String? providerId;
  String? locationId;
  String? code;
  String? courseName;
  String? description;
  double? price;
  int? quantity;
  int? soldProduct;
  int? totalSlot;
  bool? isApproved;
  bool? isActive;
  DateTime? startDate;
  DateTime? endDate;
  Location? location;
  Subject? subject;
  Provider? provider;
  List<Session>? sessions;
  List<CourseXPackage>? courseXPackages;
  String thumbnail;

  Course({
    this.subjectId,
    this.providerId,
    this.locationId,
    this.code,
    this.courseName,
    this.description,
    this.price,
    this.quantity,
    this.soldProduct,
    this.totalSlot,
    this.isApproved,
    this.isActive,
    this.startDate,
    this.endDate,
    this.location,
    this.subject,
    this.provider,
    this.sessions,
    this.courseXPackages,
    required this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      subjectId: json['subjectId'],
      providerId: json['providerId'],
      locationId: json['locationId'],
      code: json['code'],
      courseName: json['courseName'],
      description: json['description'],
      price: json['price']?.toDouble(),
      quantity: json['quantity'],
      soldProduct: json['soldProduct'],
      totalSlot: json['totalSlot'],
      isApproved: json['isApproved'],
      isActive: json['isActive'],
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      subject:
          json['subject'] != null ? Subject.fromJson(json['subject']) : null,
      provider:
          json['provider'] != null ? Provider.fromJson(json['provider']) : null,
      sessions: json['sessions'] != null
          ? (json['sessions'] as List).map((i) => Session.fromJson(i)).toList()
          : null,
      courseXPackages: json['courseXPackages'] != null
          ? (json['courseXPackages'] as List)
              .map((i) => CourseXPackage.fromJson(i))
              .toList()
          : null,
      thumbnail: 'assets/icons/water_fun_icon.jpg',
    );
  }
}
