import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/widgets/course_container.dart';
import 'package:smart_thrive_mobile/widgets/custom_icon_button.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
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
                          'Courses',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                          left: 0,
                          child: CustomIconButton(
                            child: const Icon(Icons.arrow_back),
                            height: 35,
                            width: 35,
                            onTap: () => Navigator.pop(context),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return CourseContainer(
                      course: courses[index],
                    );
                  },
                  separatorBuilder: (context, _) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: courses.length,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
