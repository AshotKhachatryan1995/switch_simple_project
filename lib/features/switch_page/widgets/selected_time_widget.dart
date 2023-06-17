import 'package:flutter/material.dart';

class SelectedTimeWidget extends StatelessWidget {
  const SelectedTimeWidget({required this.notifier, super.key});

  final ValueNotifier<DateTime?> notifier;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, DateTime? selectedTime, child) => Text(
            "Selection time: ${selectedTime ?? ""}",
            style: const TextStyle(fontSize: 14),
          ));
}
