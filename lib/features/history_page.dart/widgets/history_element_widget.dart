import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/classes/world_class.dart';
import 'package:switch_simple_project/core/enums/world_type.dart';

class HistoryElementWidget extends StatelessWidget {
  const HistoryElementWidget({required this.worldClass, super.key});

  final WorldClass? worldClass;

  @override
  Widget build(BuildContext context) {
    final WorldClass? currentWorld = worldClass;

    if (currentWorld == null) {
      return const SizedBox();
    }

    TextStyle textStyle() => TextStyle(
        color: currentWorld.worldType.historyTitleColorFromType(context));

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: currentWorld.worldType.historyBGColorFromType(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(currentWorld.dateTime.toString(), style: textStyle()),
          Text(currentWorld.worldType.name, style: textStyle())
        ],
      ),
    );
  }
}
