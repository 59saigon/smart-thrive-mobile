import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add form fields to edit the profile details here
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Links',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Bio',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle save profile changes
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
