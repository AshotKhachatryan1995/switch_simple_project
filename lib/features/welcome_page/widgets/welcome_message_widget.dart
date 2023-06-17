import 'package:flutter/material.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: const TextStyle(fontSize: 24),
      );
}
