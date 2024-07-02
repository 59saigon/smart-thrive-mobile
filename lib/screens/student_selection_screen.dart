import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/student.dart';
import 'package:smart_thrive_mobile/screens/base_screen.dart';

class StudentSelectionScreen extends StatefulWidget {
  final List<Student> students;

  const StudentSelectionScreen({Key? key, required this.students})
      : super(key: key);

  @override
  _StudentSelectionScreenState createState() => _StudentSelectionScreenState();
}

class _StudentSelectionScreenState extends State<StudentSelectionScreen> {
  Student? selectedStudent;

  void proceedToHome(BuildContext context) {
    if (selectedStudent != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BaseScreen()),
      );
    } else {
      // Show a message to select a student
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Selection Required'),
            content: const Text('Please select a student to proceed.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.school,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Select a student to continue',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Display students as selectable containers
                  Column(
                    children: widget.students.map((student) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedStudent = student;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: selectedStudent == student
                                ? Colors
                                    .blueAccent // Highlight selected student
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              const SizedBox(width: 10),
                              Text(
                                student.studentName,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () => proceedToHome(context),
                    child: const Text('Continue'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
