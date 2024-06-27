class Package {
  String packageName;
  int quantityCourse;
  String thumbnail;
  double totalPrice;

  Package({
    required this.packageName,
    required this.quantityCourse,
    required this.thumbnail,
    required this.totalPrice,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageName: json['packageName'] ?? '',
      quantityCourse: json['quantityCourse'] ?? 0,
      thumbnail: 'assets/icons/water_fun_icon.jpg',
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
    );
  }
}
