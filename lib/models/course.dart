class Course {
  String courseName;
  String description;
  String thumbnail;
  String? subject;
  String? provider;
  int? totalSlot;
  double? price;
  String? location;

  Course({
    required this.courseName,
    required this.description,
    required this.thumbnail,
    this.subject,
    this.provider,
    this.totalSlot,
    this.price,
    this.location,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'] ?? '',
      description: json['description'] ?? '',
      thumbnail: 'assets/icons/water_fun_icon.jpg',
      subject: json['subject'] ?? '',
      provider: json['provider'] ?? '',
      totalSlot: json['totalSlot'] ?? 0,
      price: (json['price'] ?? 0.0).toDouble(),
      location: json['location'] ?? '',
    );
  }
}
