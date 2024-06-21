import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/constants/color.dart';
import 'package:smart_thrive_mobile/constants/size.dart';
import 'package:smart_thrive_mobile/models/category.dart';
import 'package:smart_thrive_mobile/widgets/circle_button.dart';
import 'package:smart_thrive_mobile/widgets/category_cart.dart';
import 'package:smart_thrive_mobile/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                AppBar(),
                Body(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
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
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categoryList[index],
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
                'Hello,\nGood Morning',
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
