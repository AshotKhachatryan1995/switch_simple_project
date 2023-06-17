import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/constants/app_colors.dart';

enum WorldType { hello, bye }

extension WorldTypeAddition on WorldType {
  String getTextFromType() {
    switch (this) {
      case WorldType.hello:
        return "Hello World";
      case WorldType.bye:
        return "Bye World";
    }
  }

  Brightness getBrightnessFromType() {
    switch (this) {
      case WorldType.hello:
        return Brightness.light;
      case WorldType.bye:
        return Brightness.dark;
    }
  }

  Color historyTitleColorFromType(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (this) {
      case WorldType.hello:
        return colorScheme.historyTitleDarkColor;
      case WorldType.bye:
        return colorScheme.historyTitleLightColor;
    }
  }

  Color historyBGColorFromType(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (this) {
      case WorldType.hello:
        return colorScheme.historyBGLightColor;
      case WorldType.bye:
        return colorScheme.historyBGDartColor;
    }
  }
}
