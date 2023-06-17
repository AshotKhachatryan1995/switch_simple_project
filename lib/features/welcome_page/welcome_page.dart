import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switch_simple_project/core/enums/world_type.dart';
import 'package:switch_simple_project/core/widgets/base_app_bar.dart';
import 'package:switch_simple_project/core/widgets/button_widget.dart';
import 'package:switch_simple_project/features/welcome_page/widgets/welcome_message_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({required this.worldType, super.key});
  static const route = "/welcome_page";

  final WorldType worldType;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final ThemeData specialThemeData;

  @override
  void initState() {
    super.initState();

    specialThemeData = ThemeData(
      brightness: widget.worldType.getBrightnessFromType(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: specialThemeData,
      child: Scaffold(appBar: _baseAppBar(), body: _renderBody()),
    );
  }

  Widget _renderBody() => Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        WelcomeMessageWidget(title: widget.worldType.getTextFromType()),
        const SizedBox(height: 50),
        ButtonWidget(title: "PREVIOUS PAGE", onTap: () => context.pop())
      ]));

  BaseAppBar _baseAppBar() => BaseAppBar(
        title: "Welcome Page",
        appBar: AppBar(),
        automaticallyImplyLeading: false,
      );
}
