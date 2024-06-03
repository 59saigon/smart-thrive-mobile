import 'package:flutter/material.dart';
import 'package:smart_thrive_mobile/constants/color.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressd;
  const CircleButton({Key? key, required this.icon, required this.onPressd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryLight,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
