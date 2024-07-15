import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/models/user.dart';
import 'dart:convert';
import 'package:smart_thrive_mobile/services/api_service.dart';
import 'package:http/http.dart' as http;

class UserStatisticScreen extends StatefulWidget {
  const UserStatisticScreen({super.key});

  @override
  _UserStatisticScreenState createState() => _UserStatisticScreenState();
}

class _UserStatisticScreenState extends State<UserStatisticScreen> {
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      List<User> fetchedUsers = await APIService.getUsers();
      setState(() {
        userList = fetchedUsers;
      });
    } on Exception {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('${user.fullName}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${user.username}'),
                  Text('Email: ${user.email}'),
                  Text('Day Of Birth: ${user.dob}'),
                  Text('Address: ${user.address}'),
                  Text('Gender: ${user.gender}'),
                  Text('Phone: ${user.phone}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
