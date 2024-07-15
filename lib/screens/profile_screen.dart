import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/profiledetail.dart';
import 'package:smart_thrive_mobile/screens/editprofile_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/icons/avatar.png'), // Your avatar image
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Handle edit profile image
                      },
                      child: const Text(
                        'Edit profile image',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ProfileDetail(
                  title: 'Name', value: 'Nguyễn Hoàng Sơn', onTap: () {}),
              ProfileDetail(
                  title: 'Username', value: 'hoangsonkeke', onTap: () {}),
              ProfileDetail(
                  title: 'Email', value: 'besonnhabe@gmail.com', onTap: () {}),
              ProfileDetail(
                title: 'Links',
                value:
                    'https://web.facebook.com/zhson.20\nhttps://github.com/59saigon',
                onTap: () {},
                isMultiline: true,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Handle add link
                },
                child: const Text(
                  '+ Add link',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ProfileDetail(
                title: 'Bio',
                value: 'Tui là bé sơn nhà bè nè keke',
                onTap: () {},
                isMultiline: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
