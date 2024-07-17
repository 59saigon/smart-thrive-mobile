import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/shared_preferences.dart';
import 'package:smart_thrive_mobile/models/user.dart';
import 'package:smart_thrive_mobile/screens/editprofile_screen.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User> _user;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    String? userEmail = await getUserEmail();
    if (userEmail != null) {
      setState(() {
        _user = APIService.getUserByEmail(userEmail);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<User>(
        future: _user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading profile'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileField(label: 'Username', value: '${user.username}'),
                  ProfileField(label: 'Fullname', value: user.fullName),
                  ProfileField(label: 'Email', value: user.email),
                  ProfileField(label: 'DOB', value: '${user.dob}'),
                  ProfileField(label: 'Address', value: '${user.address}'),
                  ProfileField(label: 'Gender', value: '${user.gender}'),
                  ProfileField(label: 'Phone', value: '${user.phone}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(user: user),
                        ),
                      );
                    },
                    child: const Text('Edit Profile'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No profile data found'));
          }
        },
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
