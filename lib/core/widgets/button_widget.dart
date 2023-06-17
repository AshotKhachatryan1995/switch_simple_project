import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/constants/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({required this.title, this.onTap, super.key});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.buttonBGColor),
            child: Text(
              title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.buttonTitleColor),
            )),
      );
}
