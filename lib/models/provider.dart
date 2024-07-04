import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/models/user.dart';

class Provider {
  String userId;
  String companyName;
  String website;
  User? user;
  List<Course>? courses;

  Provider({
    required this.userId,
    required this.companyName,
    required this.website,
    this.user,
    this.courses,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      userId: json['userId'],
      companyName: json['companyName'],
      website: json['website'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      courses: json['courses'] != null
          ? (json['courses'] as List).map((i) => Course.fromJson(i)).toList()
          : null,
    );
  }
}
