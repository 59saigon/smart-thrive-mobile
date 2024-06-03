import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_thrive_mobile/widgets/circle_button.dart';

import '../widgets/search_field.dart';

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
        body: Column(
          children: const [
            SafeArea(
              child: AppBar(),
            )
          ],
        ),
      ),
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
            Color(0xff887ff2),
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
              )
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
