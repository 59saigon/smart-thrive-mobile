import 'package:flutter/material.dart';

class Student {
  final String userId;
  final String studentName;
  final String gender;
  final DateTime dob;

  Student({
    required this.userId,
    required this.studentName,
    required this.gender,
    required this.dob,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      userId: json['userId'],
      studentName: json['studentName'],
      gender: json['gender'],
      dob: DateTime.parse(json['dob']),
    );
  }
}
