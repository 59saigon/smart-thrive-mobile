import 'package:flutter/material.dart';

class UploadCourseScreen extends StatelessWidget {
  const UploadCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Course Title',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Duration',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your upload logic here
              },
              child: const Text('Upload Course'),
            ),
          ],
        ),
      ),
    );
  }
}
