import 'package:flutter/material.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Help & Support'),
        ),
        body: const Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
                'If you see any error occur during using this application, please contact us through smartthrive@gmail.com'),
          ),
        ));
  }
}
