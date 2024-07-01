import 'package:intl/intl.dart'; // Ensure you import the intl package for date formatting

class Course {
  String courseName;
  String description;
  String thumbnail;
  String? subject;
  String? provider;
  String? session;
  int? totalSlot;
  double? price;
  String? location;
  DateTime? startDate;
  DateTime? endDate;

  Course({
    required this.courseName,
    required this.description,
    required this.thumbnail,
    this.subject,
    this.provider,
    this.session,
    this.totalSlot,
    this.price,
    this.location,
    this.startDate,
    this.endDate,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'] ?? '',
      description: json['description'] ?? '',
      thumbnail: 'assets/icons/water_fun_icon.jpg',
      subject: json['subject'],
      provider: json['provider'],
      session: json['session'],
      totalSlot: json['totalSlot'],
      price: (json['price'] as num?)?.toDouble(),
      location: json['location'],
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
    );
  }
}
