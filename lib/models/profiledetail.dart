import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final bool isMultiline;

  const ProfileDetail({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(value),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0.0),
        ),
        const Divider(),
      ],
    );
  }
}
