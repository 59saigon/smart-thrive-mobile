import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/student.dart';
import 'package:smart_thrive_mobile/screens/base_screen.dart';

class StudentSelectionScreen extends StatefulWidget {
  final List<Student> students;
  final String role;

  const StudentSelectionScreen({
    Key? key,
    required this.students,
    required this.role,
  }) : super(key: key);

  @override
  _StudentSelectionScreenState createState() => _StudentSelectionScreenState();
}

class _StudentSelectionScreenState extends State<StudentSelectionScreen> {
  Student? selectedStudent;

  void proceedToHome(BuildContext context) {
    if (selectedStudent != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              BaseScreen(studentId: selectedStudent!.id, roleName: widget.role),
        ),
      );
    } else {
      // Handle case where no student is selected
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Selection Required'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Select a student or continue without selecting.'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BaseScreen(studentId: '', roleName: widget.role),
                      ),
                    );
                  },
                  child: const Text('Continue without selecting student'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
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
                              ? Colors.blueAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(width: 10),
                            Text(
                              student.studentName ?? 'Unknown',
                              style: const TextStyle(
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
    );
  }
}
