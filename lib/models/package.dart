import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/courseXpackage.dart';
import 'package:smart_thrive_mobile/models/order.dart';
import 'package:smart_thrive_mobile/models/student.dart';

class Package extends BaseEntity {
  String studentId;
  String packageName;
  DateTime? startDate;
  DateTime? endDate;
  int? quantityCourse;
  double totalPrice;
  bool? isActive;
  Student? student;
  List<CourseXPackage>? courseXPackages;
  List<Order>? orders;
  String thumbnail;

  Package({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    required this.studentId,
    required this.packageName,
    this.startDate,
    this.endDate,
    this.quantityCourse,
    required this.totalPrice,
    this.isActive,
    this.student,
    this.courseXPackages,
    this.orders,
    required this.thumbnail,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      studentId: json['studentId'],
      packageName: json['packageName'],
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      quantityCourse: json['quantityCourse'],
      totalPrice: json['totalPrice'],
      isActive: json['isActive'],
      student:
          json['student'] != null ? Student.fromJson(json['student']) : null,
      courseXPackages: json['courseXPackages'] != null
          ? List<CourseXPackage>.from(json['courseXPackages']
              .map((model) => CourseXPackage.fromJson(model)))
          : null,
      orders: json['orders'] != null
          ? List<Order>.from(
              json['orders'].map((model) => Order.fromJson(model)))
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
      'studentId': studentId,
      'packageName': packageName,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'quantityCourse': quantityCourse,
      'totalPrice': totalPrice,
      'isActive': isActive,
      'student': student?.toJson(),
      'courseXPackages': courseXPackages != null
          ? courseXPackages!.map((model) => model.toJson()).toList()
          : null,
      'orders': orders != null
          ? orders!.map((model) => model.toJson()).toList()
          : null,
    };
  }
}
