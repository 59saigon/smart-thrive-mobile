class Course {
  String courseName;
  int totalSlot; // Changed from double to int
  String description;
  String thumbnail;

  Course({
    required this.courseName,
    required this.totalSlot,
    required this.description,
    required this.thumbnail,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'] ?? '',
      totalSlot: json['totalSlot'] ?? 0,
      description: json['description'] ?? '',
      thumbnail: 'assets/icons/water_fun_icon.jpg',
    );
  }
}
