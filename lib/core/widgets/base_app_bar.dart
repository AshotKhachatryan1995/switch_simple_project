import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/constants/app_colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    required this.title,
    required this.appBar,
    this.actions,
    this.automaticallyImplyLeading = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final AppBar appBar;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).colorScheme.selectedBGSwitchColor,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
