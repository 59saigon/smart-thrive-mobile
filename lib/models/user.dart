import 'package:smart_thrive_mobile/models/location.dart';
import 'package:smart_thrive_mobile/models/provider.dart';
import 'package:smart_thrive_mobile/models/role.dart';
import 'package:smart_thrive_mobile/models/student.dart';

class User {
  String? username;
  String? password;
  String fullName;
  String email;
  DateTime? dob;
  String? address;
  String? gender;
  String? phone;
  bool? status;
  String roleId;
  String? locationId;
  Role? role;
  Location? location;
  Provider? provider;
  List<Student>? students;

  User({
    this.username,
    this.password,
    required this.fullName,
    required this.email,
    this.dob,
    this.address,
    this.gender,
    this.phone,
    this.status,
    required this.roleId,
    this.locationId,
    this.role,
    this.location,
    this.provider,
    this.students,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      fullName: json['fullName'],
      email: json['email'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      address: json['address'],
      gender: json['gender'],
      phone: json['phone'],
      status: json['status'],
      roleId: json['roleId'],
      locationId: json['locationId'],
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      provider:
          json['provider'] != null ? Provider.fromJson(json['provider']) : null,
      students: json['students'] != null
          ? (json['students'] as List).map((i) => Student.fromJson(i)).toList()
          : null,
    );
  }
}
