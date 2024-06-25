class Package {
  String thumbnail;
  String packageName;
  int quantityCourse;

  Package({
    required this.packageName,
    required this.quantityCourse,
    required this.thumbnail,
  });
}

List<Package> packageList = [
  Package(
    packageName: 'Water Fun',
    quantityCourse: 3,
    thumbnail: 'assets/icons/water_fun_icon.jpg',
  ),
  Package(
    packageName: 'Ball Games',
    quantityCourse: 3,
    thumbnail: 'assets/icons/ball_games_icon.jpg',
  ),
  Package(
    packageName: 'Indoor Fun',
    quantityCourse: 3,
    thumbnail: 'assets/icons/indoor_fun_icon.jpg',
  ),
  Package(
    packageName: 'Adventure Sports',
    quantityCourse: 3,
    thumbnail: 'assets/icons/adventure_sports_icon.jpg',
  ),
];
