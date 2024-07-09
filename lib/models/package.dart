class Package {
  String id;
  String studentId;
  String packageName;
  DateTime startDate;
  DateTime endDate;
  int quantityCourse;
  double totalPrice;
  bool isActive;
  String createdBy;
  DateTime createdDate;
  String lastUpdatedBy;
  DateTime lastUpdatedDate;
  bool isDeleted;
  String thumbnail;

  Package({
    required this.id,
    required this.studentId,
    required this.packageName,
    required this.startDate,
    required this.endDate,
    required this.quantityCourse,
    required this.totalPrice,
    required this.isActive,
    required this.createdBy,
    required this.createdDate,
    required this.lastUpdatedBy,
    required this.lastUpdatedDate,
    required this.isDeleted,
    required this.thumbnail,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['id'] ?? '',
      studentId: json['studentId'] ?? '',
      packageName: json['packageName'] ?? '',
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      quantityCourse: json['quantityCourse'] ?? 0,
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
      isActive: json['isActive'] ?? false,
      createdBy: json['createdBy'] ?? '',
      createdDate: DateTime.parse(json['createdDate']),
      lastUpdatedBy: json['lastUpdatedBy'] ?? '',
      lastUpdatedDate: DateTime.parse(json['lastUpdatedDate']),
      isDeleted: json['isDeleted'] ?? false,
      thumbnail: 'assets/icons/water_fun_icon.jpg',
    );
  }
}
