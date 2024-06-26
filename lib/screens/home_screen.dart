import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';
import 'package:smart_thrive_mobile/constants/color.dart';
import 'package:smart_thrive_mobile/constants/size.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/widgets/circle_button.dart';
import 'package:smart_thrive_mobile/widgets/package_card.dart';
import 'package:smart_thrive_mobile/widgets/search_field.dart';
import 'package:smart_thrive_mobile/screens/all_package_screen.dart'; // Import the AllPackageScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      List<Package> packages = await APIService.getPackages();
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
                Body(packageList: packageList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final List<Package> packageList;

  const Body({Key? key, required this.packageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Display only the first 4 packages
    List<Package> limitedPackages = packageList.take(4).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Package",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: () {
                  // Navigate to AllPackageScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllPackageScreen()),
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
            itemCount: limitedPackages.length,
            itemBuilder: (context, index) {
              return PackageCard(
                package: limitedPackages[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

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
                icon: Icons.notifications,
                onPressd: () {},
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
