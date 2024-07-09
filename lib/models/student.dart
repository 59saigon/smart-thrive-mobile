class Student {
  final String id;
  final String studentName;
  final String gender;
  final DateTime dob;

  Student({
    required this.id,
    required this.studentName,
    required this.gender,
    required this.dob,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      studentName: json['studentName'],
      gender: json['gender'],
      dob: DateTime.parse(json['dob']),
    );
  }
}
