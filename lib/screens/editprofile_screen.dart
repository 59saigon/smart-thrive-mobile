import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_thrive_mobile/models/user.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class EditProfileScreen extends StatefulWidget {
  final User user;

  const EditProfileScreen({super.key, required this.user});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _fullnameController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _addressController;
  late TextEditingController _genderController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.user.username);
    _fullnameController = TextEditingController(text: widget.user.fullName);
    _emailController = TextEditingController(text: widget.user.email);
    _dobController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(widget.user.dob!));
    _addressController = TextEditingController(text: widget.user.address);
    _genderController = TextEditingController(text: widget.user.gender);
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() async {
    Map<String, dynamic> requestBody = {
      'username': _usernameController.text,
      'firstname': _fullnameController.text.split(' ')[0],
      'lastname': _fullnameController.text.split(' ')[1],
      'email': _emailController.text,
      'dayOfBirth': _dobController.text,
      'address': _addressController.text,
      'gender': _genderController.text,
      'phone': _phoneController.text,
    };

    try {
      await APIService.updateUser(requestBody);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Username', _usernameController),
            _buildTextField('Fullname', _fullnameController),
            _buildTextField('Email', _emailController),
            _buildTextField('DOB', _dobController),
            _buildTextField('Address', _addressController),
            _buildTextField('Gender', _genderController),
            _buildTextField('Phone', _phoneController),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
