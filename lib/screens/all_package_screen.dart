import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/widgets/package_card.dart';
import 'package:smart_thrive_mobile/widgets/custom_icon_button.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';

class AllPackageScreen extends StatefulWidget {
  const AllPackageScreen({super.key});

  @override
  _AllPackageScreenState createState() => _AllPackageScreenState();
}

class _AllPackageScreenState extends State<AllPackageScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      List<Package> fetchedPackages = await APIService.getPackages();
      setState(() {
        packageList = fetchedPackages;
      });
    } catch (e) {
      print('Failed to fetch packages: $e');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          'Packages',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: CustomIconButton(
                          height: 35,
                          width: 35,
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: packageList.length,
                    itemBuilder: (context, index) {
                      return PackageCard(
                        package: packageList[index],
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
