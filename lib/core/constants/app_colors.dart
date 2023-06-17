import 'package:flutter/material.dart';

extension AppColorTheme on ColorScheme {
  Color get selectedBGSwitchColor => const Color.fromARGB(255, 15, 143, 11);
  Color get switchBorderColor => const Color.fromARGB(255, 15, 143, 11);

  Color get buttonBGColor => const Color.fromARGB(255, 60, 145, 81);
  Color get buttonTitleColor => const Color.fromARGB(255, 253, 246, 246);

  Color get historyTitleLightColor => const Color.fromARGB(255, 237, 232, 232);
  Color get historyTitleDarkColor => const Color.fromARGB(255, 23, 22, 22);
  Color get historyBGLightColor => const Color.fromARGB(255, 237, 232, 232);
  Color get historyBGDartColor => const Color.fromARGB(255, 23, 22, 22);
}
