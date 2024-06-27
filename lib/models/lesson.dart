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
    isCompleted: true,
    isPlaying: true,
    name: "FootBall 1",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "FootBall 2",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "FootBall 3",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "FootBall 4",
  ),
  Lesson(
    duration: '90 min',
    isCompleted: false,
    isPlaying: false,
    name: "FootBall 5",
  ),
];
