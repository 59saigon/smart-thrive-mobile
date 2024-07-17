import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';
import 'package:smart_thrive_mobile/constants/color.dart';
import 'package:smart_thrive_mobile/widgets/circle_button.dart';
import 'package:smart_thrive_mobile/widgets/create_package_dialog.dart';
import 'package:smart_thrive_mobile/widgets/package_container.dart';
import 'package:smart_thrive_mobile/widgets/search_field.dart';

class MyCourseScreen extends StatefulWidget {
  final String studentId;

  const MyCourseScreen({super.key, required this.studentId});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  void _refreshPackages() {
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      List<Package> packages =
          await APIService.getPackagesByStudentId(widget.studentId);
      packages.sort((a, b) => b.createdDate.compareTo(a.createdDate));

      packages = packages.where((package) => !package.isDeleted).toList();

      setState(() {
        packageList = packages;
      });
    } catch (e) {
      print('Failed to fetch packages: $e');
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
                const AppBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Create new package",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CreatePackageDialog(
                                studentId: widget.studentId,
                                refreshCallback: () {
                                  fetchPackages();
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Create package",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: packageList.length,
                    itemBuilder: (context, index) {
                      if (packageList[index].isDeleted) {
                        return const SizedBox
                            .shrink(); // Return an empty widget for deleted packages
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: PackageContainer(
                          package: packageList[index],
                          studentId: widget.studentId,
                          onUpdateSuccess:
                              _refreshPackages, // Pass the refresh method here
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

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
                'Student Package',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
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
