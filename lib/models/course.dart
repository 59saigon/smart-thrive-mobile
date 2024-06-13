class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "VietNguyen",
    completedPercentage: .75,
    name: "Football",
    thumbnail: "assets/icons/football_icon.jpg",
  ),
  Course(
    author: "VietNguyen",
    completedPercentage: .60,
    name: "Volleyball",
    thumbnail: "assets/icons/volleyball_icon.png",
  ),
  Course(
    author: "VietNguyen",
    completedPercentage: .75,
    name: "Basketball",
    thumbnail: "assets/icons/basketball_icon.png",
  ),
  Course(
    author: "VietNguyen",
    completedPercentage: .75,
    name: "Tenis",
    thumbnail: "assets/icons/tenis_icon.png",
  ),
  Course(
    author: "VietNguyen",
    completedPercentage: .60,
    name: "Badminton",
    thumbnail: "assets/icons/badminton_icon.jpg",
  ),
  Course(
    author: "VietNguyen",
    completedPercentage: .75,
    name: "Pickleball",
    thumbnail: "assets/icons/pickleball_icon.png",
  ),
];
