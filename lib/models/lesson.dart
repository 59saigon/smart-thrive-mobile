class Lesson {
  String name;
  String duration;
  bool isPlaying;
  bool isCompleted;

  Lesson({
    required this.duration,
    required this.isCompleted,
    required this.isPlaying,
    required this.name,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "Lesson 1",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "Lesson 2",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "Lesson 3",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "Lesson 4",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "Lesson 5",
  ),
];
