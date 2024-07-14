import 'package:smart_thrive_mobile/models/base_entity.dart';
import 'package:smart_thrive_mobile/models/role.dart';

class User extends BaseEntity {
  String? username;
  String? password;
  String firstName;
  String lastName;
  String fullName;
  String? picture;
  String email;
  DateTime? dob;
  String? address;
  String? gender;
  String? phone;
  bool? status;
  String roleId;
  Role? role;

  User({
    required String id,
    String? createdBy,
    required DateTime createdDate,
    String? lastUpdatedBy,
    DateTime? lastUpdatedDate,
    required bool isDeleted,
    this.username,
    this.password,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.picture,
    required this.email,
    this.dob,
    this.address,
    this.gender,
    this.phone,
    this.status,
    required this.roleId,
    this.role,
  }) : super(
            id: id,
            createdBy: createdBy,
            createdDate: createdDate,
            lastUpdatedBy: lastUpdatedBy,
            lastUpdatedDate: lastUpdatedDate,
            isDeleted: isDeleted);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdBy: json['createdBy'],
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'],
      lastUpdatedDate: json['lastUpdatedDate'] != null
          ? DateTime.parse(json['lastUpdatedDate'])
          : null,
      isDeleted: json['isDeleted'],
      username: json['username'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      picture: json['picture'],
      email: json['email'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      address: json['address'],
      gender: json['gender'],
      phone: json['phone'],
      status: json['status'],
      roleId: json['roleId'],
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
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
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'picture': picture,
      'email': email,
      'dob': dob?.toIso8601String(),
      'address': address,
      'gender': gender,
      'phone': phone,
      'status': status,
      'roleId': roleId,
      'role': role?.toJson(),
    };
  }
}
