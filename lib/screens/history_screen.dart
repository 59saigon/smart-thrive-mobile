import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History'),
      ),
      body: const Center(
        child: Text('History'),
      ),
    );
  }
}
