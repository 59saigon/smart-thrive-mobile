class Category {
  String thumbnail;
  String name;
  int noOfCourses;

  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Water Fun',
    noOfCourses: 3,
    thumbnail: 'assets/icons/water_fun_icon.jpg',
  ),
  Category(
    name: 'Ball Games',
    noOfCourses: 3,
    thumbnail: 'assets/icons/ball_games_icon.jpg',
  ),
  Category(
    name: 'Indoor Fun',
    noOfCourses: 3,
    thumbnail: 'assets/icons/indoor_fun_icon.jpg',
  ),
  Category(
    name: 'Adventure Sports',
    noOfCourses: 3,
    thumbnail: 'assets/icons/adventure_sports_icon.jpg',
  ),
];
