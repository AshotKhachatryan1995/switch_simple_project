import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/enums/world_type.dart';

class SelectedOptionWidget extends StatelessWidget {
  const SelectedOptionWidget({required this.notifier, super.key});

  final ValueNotifier<int> notifier;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, int selectedIndex, child) => Text(
            "Selected option: ${WorldType.values[selectedIndex].getTextFromType()}",
            style: const TextStyle(fontSize: 14),
          ));
}
