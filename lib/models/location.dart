import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/models/user.dart';

class Location {
  String city;
  String district;
  String ward;
  List<User>? users;
  List<Course>? courses;

  Location({
    required this.city,
    required this.district,
    required this.ward,
    this.users,
    this.courses,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      district: json['district'],
      ward: json['ward'],
      users: json['users'] != null
          ? (json['users'] as List).map((i) => User.fromJson(i)).toList()
          : null,
      courses: json['courses'] != null
          ? (json['courses'] as List).map((i) => Course.fromJson(i)).toList()
          : null,
    );
  }
}
