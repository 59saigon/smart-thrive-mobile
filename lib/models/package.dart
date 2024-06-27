class Package {
  String packageName;
  int quantityCourse;
  String thumbnail;

  Package({
    required this.packageName,
    required this.quantityCourse,
    required this.thumbnail,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageName: json['packageName'],
      quantityCourse: json['quantityCourse'],
      thumbnail:
          'assets/icons/water_fun_icon.jpg', // Use a default icon for now
    );
  }
}
