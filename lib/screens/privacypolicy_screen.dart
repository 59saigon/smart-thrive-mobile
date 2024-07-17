import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Privacy & Policy'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'At ',
                      ),
                      TextSpan(
                        text: 'Smart Thrive',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ', we prioritize your privacy and are committed to protecting your personal information. We collect various types of information, including personal details like your name, email address, and payment information, as well as data on how you interact with our site, such as IP addresses and browsing behavior. This information is used to manage your account, process transactions, communicate with you, and improve our services. We ensure your data is handled securely and only shared with trusted third parties necessary for operating our platform.',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
