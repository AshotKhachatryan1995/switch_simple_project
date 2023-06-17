import 'package:flutter/material.dart';
import 'package:switch_simple_project/core/classes/world_class.dart';
import 'package:switch_simple_project/core/mixins/history_mixin.dart';
import 'package:switch_simple_project/core/widgets/base_app_bar.dart';
import 'package:switch_simple_project/features/history_page.dart/widgets/history_element_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  static const route = "/history_page";

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with HistoyMixin {
  late final Map<int, WorldClass> _historyMap;

  @override
  void initState() {
    super.initState();

    _historyMap = HistoyMixin.historyMap;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BaseAppBar(
          title: "History Page",
          appBar: AppBar(),
        ),
        body: _renderBody(),
      );

  Widget _renderBody() => ListView.builder(
      itemCount: _historyMap.length,
      itemBuilder: (context, index) =>
          HistoryElementWidget(worldClass: _historyMap[index]));
}
