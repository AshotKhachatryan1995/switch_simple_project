import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/constants/app_colors.dart';

class SegmentedControlWidget extends StatelessWidget {
  const SegmentedControlWidget(
      {required this.notifier,
      required this.children,
      this.onValueChanged,
      super.key});

  final ValueNotifier<int> notifier;
  final Map<int, Widget> children;
  final Function(int)? onValueChanged;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, int selectedIndex, child) => CupertinoSegmentedControl(
          children: children,
          selectedColor: Theme.of(context).colorScheme.selectedBGSwitchColor,
          borderColor: Theme.of(context).colorScheme.switchBorderColor,
          groupValue: selectedIndex,
          pressedColor: Colors.transparent,
          onValueChanged: (val) => onValueChanged?.call(val)));
}
