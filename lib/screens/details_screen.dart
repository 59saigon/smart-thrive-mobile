import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_thrive_mobile/constants/color.dart';
import 'package:smart_thrive_mobile/constants/icons.dart';
import 'package:smart_thrive_mobile/models/course.dart';
import 'package:smart_thrive_mobile/models/lesson.dart';
import 'package:smart_thrive_mobile/models/package.dart';
import 'package:smart_thrive_mobile/services/api_service.dart';
import 'package:smart_thrive_mobile/widgets/custom_video_player.dart';
import 'package:smart_thrive_mobile/widgets/lesson_card.dart';

class DetailsScreen extends StatefulWidget {
  final Course course;
  final String studentId;

  const DetailsScreen({
    Key? key,
    required this.course,
    required this.studentId,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _selectedTab = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  Future<void> _showPackageBottomSheet(BuildContext context) async {
    List<Package> packageList = [];
    try {
      packageList = await APIService.getPackagesByStudentId(widget.studentId);
      packageList.sort((a, b) => b.createdDate.compareTo(a.createdDate));
      packageList = packageList.where((package) => !package.isDeleted).toList();
    } catch (e) {
      print('Failed to fetch packages: $e');
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            controller: scrollController,
            itemCount: packageList.length,
            itemBuilder: (context, index) {
              if (packageList[index].isDeleted) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  onTap: () =>
                      _confirmAddCourseToPackage(context, packageList[index]),
                  title: Text(packageList[index].packageName),
                  subtitle: Text(
                      'Quantity Course: ${packageList[index].quantityCourse}'),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      packageList[index].thumbnail,
                      height: 60,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _confirmAddCourseToPackage(
      BuildContext context, Package package) async {
    bool confirmAdd = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Add Course'),
          content: Text(
            'Do you want to add "${widget.course.courseName}" to "${package.packageName}"?',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
                try {
                  await APIService.addCourseToPackage(
                      widget.course.id, package.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Course added to package successfully'),
                    ),
                  );
                } catch (e) {
                  print('Error adding course to package: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to add course to package'),
                    ),
                  );
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );

    if (confirmAdd == true) {
      // Handle add course to package confirmation
    }
  }

  @override
  Widget build(BuildContext context) {
    int numberOfDays = widget.course.startDate != null &&
            widget.course.endDate != null
        ? widget.course.endDate!.difference(widget.course.startDate!).inDays + 1
        : 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          widget.course.courseName ?? 'Unknown Course',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const CustomVideoPlayer(),
                const SizedBox(height: 15),
                Text(
                  widget.course.address ?? 'Unknown address',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.course.providerId ?? 'Unknown provider',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Image.asset(
                      icFeaturedOutlined,
                      height: 20,
                    ),
                    Text(
                      ' ${widget.course.totalSlots ?? 0} Slots',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                    ),
                    Text(
                      ' $numberOfDays Days',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      ' \$${widget.course.price?.toStringAsFixed(2) ?? "0.00"}',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTabView(
                  index: _selectedTab,
                  changeTab: changeTab,
                ),
                _selectedTab == 0
                    ? const Session()
                    : CourseDescription(course: widget.course),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          backgroundColor: Colors.white,
          enableDrag: false,
          builder: (context) {
            return SizedBox(
              height: 80,
              child: EnrollBottomSheet(
                onAddToPackage: () => _showPackageBottomSheet(context),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Session extends StatelessWidget {
  const Session({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        padding: const EdgeInsets.only(top: 20, bottom: 40),
        shrinkWrap: true,
        itemCount: lessonList.length,
        itemBuilder: (_, index) => LessonCard(lesson: lessonList[index]),
      ),
    );
  }
}

class CourseDescription extends StatelessWidget {
  final Course course;

  const CourseDescription({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        'Description: ${course.description ?? "No description available."}',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;

  const CustomTabView({
    Key? key,
    required this.changeTab,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tabs = ['Session', 'Description'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: _tabs
            .asMap()
            .entries
            .map((entry) => _buildTab(entry.key, entry.value))
            .toList(),
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    return GestureDetector(
      onTap: () => widget.changeTab(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: widget.index == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class EnrollBottomSheet extends StatelessWidget {
  final VoidCallback onAddToPackage;

  const EnrollBottomSheet({
    Key? key,
    required this.onAddToPackage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {},
            height: 45,
            width: 45,
            child: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: CustomIconButton(
              onTap: onAddToPackage,
              color: kPrimaryColor,
              height: 45,
              width: 45,
              child: const Text(
                'Add to package',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color? color;
  final VoidCallback onTap;

  const CustomIconButton({
    Key? key,
    required this.child,
    required this.height,
    required this.width,
    this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Center(child: child),
        onTap: onTap,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ),
        ],
      ),
    );
  }
}
