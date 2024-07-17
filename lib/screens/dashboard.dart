import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/screens/coursestatistic_screen.dart';
import 'package:smart_thrive_mobile/screens/userstatistic_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text('Dashboard'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/icons/avatar.png'), // Your avatar image
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatisticCard(
              icon: Icons.person,
              title: 'User',
              details: const [],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserStatisticScreen()),
                );
              },
            ),
            const SizedBox(height: 16.0),
            StatisticCard(
              icon: Icons.library_books,
              title: 'Course',
              details: const [],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CourseStatisticScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> details;
  final VoidCallback onTap;

  const StatisticCard({
    super.key,
    required this.icon,
    required this.title,
    required this.details,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40.0),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    ...details.map((detail) => Text(detail)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
