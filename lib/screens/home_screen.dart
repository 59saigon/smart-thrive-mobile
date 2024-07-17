import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/screens/all_course_screen.dart';
import 'package:smart_thrive_mobile/screens/login_screen.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';
import 'package:smart_thrive_mobile/constants/color.dart';
import 'package:smart_thrive_mobile/widgets/circle_button.dart';
import 'package:smart_thrive_mobile/widgets/course_card.dart';
import 'package:smart_thrive_mobile/widgets/search_field.dart'; // Import the AllPackageScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Course> courseList = [];

  @override
  void initState() {
    super.initState();
    fetchCourse();
  }

  Future<void> fetchCourse() async {
    try {
      List<Course> courses = await APIService.getCourses();
      setState(() {
        courseList = courses;
      });
    } catch (e) {
      print('Failed to fetch courses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyAppBar(),
                Body(courseList: courseList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final List<Course> courseList;

  const Body({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    // Display only the first 4 packages
    List<Course> limitedCourses = courseList.take(4).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Courses",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllCourseScreen()),
                  );
                },
                child: Text(
                  "See All",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
            ),
            itemCount: limitedCourses.length,
            itemBuilder: (context, index) {
              return CourseCard(
                course: limitedCourses[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xff886ff2),
            Color(0xff6849ef),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What will you learn today?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(
                icon: Icons.logout,
                onPressed: () async {
                  bool? shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Log Out'),
                        content:
                            const Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Log Out'),
                          ),
                        ],
                      );
                    },
                  );

                  if (shouldLogout == true) {
                    await APIService.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField(),
        ],
      ),
    );
  }
}
