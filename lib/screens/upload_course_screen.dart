import 'package:flutter/material.dart';

class UploadCourseScreen extends StatelessWidget {
  const UploadCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Course Title',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Duration',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your upload logic here
              },
              child: Text('Upload Course'),
            ),
          ],
        ),
      ),
    );
  }
}
