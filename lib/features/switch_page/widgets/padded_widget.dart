import 'package:flutter/material.dart';

class PaddedWidget extends StatelessWidget {
  const PaddedWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: child);
  }
}
