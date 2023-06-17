import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switch_simple_project/core/classes/world_class.dart';
import 'package:switch_simple_project/core/enums/world_type.dart';
import 'package:switch_simple_project/core/mixins/history_mixin.dart';
import 'package:switch_simple_project/core/widgets/base_app_bar.dart';
import 'package:switch_simple_project/core/widgets/button_widget.dart';
import 'package:switch_simple_project/features/history_page.dart/history_page.dart';
import 'package:switch_simple_project/features/switch_page/widgets/padded_widget.dart';
import 'package:switch_simple_project/features/switch_page/widgets/segmented_control_widget.dart';
import 'package:switch_simple_project/features/switch_page/widgets/selected_option_widget.dart';
import 'package:switch_simple_project/features/switch_page/widgets/selected_time_widget.dart';
import 'package:switch_simple_project/features/switch_page/widgets/switch_title_widget.dart';
import 'package:switch_simple_project/features/welcome_page/welcome_page.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});
  static const route = "/switch_page";

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> with HistoyMixin {
  late final Map<int, Widget> _segmentedChildrens;
  final ValueNotifier<int> _selectedSegmentNotifier = ValueNotifier(0);
  final ValueNotifier<DateTime?> _selectedTimeNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();

    _segmentedChildrens = WorldType.values.asMap().map((key, value) =>
        MapEntry(key, PaddedWidget(child: Text(value.getTextFromType()))));
  }

  @override
  void dispose() {
    _selectedSegmentNotifier.dispose();
    _selectedTimeNotifier.dispose();

    clearHistory();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _baseAppBar(), body: _renderBody());
  }

  Widget _renderBody() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SwitchTitleWidget(),
            const SizedBox(height: 20),
            SegmentedControlWidget(
                notifier: _selectedSegmentNotifier,
                children: _segmentedChildrens,
                onValueChanged: _onValueChanged),
            const SizedBox(height: 50),
            SelectedTimeWidget(notifier: _selectedTimeNotifier),
            const SizedBox(height: 20),
            SelectedOptionWidget(notifier: _selectedSegmentNotifier),
            const SizedBox(height: 50),
            ButtonWidget(
                title: "NEXT PAGE",
                onTap: () => context.push(WelcomePage.route,
                    extra: WorldType.values[_selectedSegmentNotifier.value]))
          ],
        ),
      );

  BaseAppBar _baseAppBar() => BaseAppBar(
        title: "Switch Page",
        appBar: AppBar(),
        actions: [
          PaddedWidget(
              child: InkWell(
                  onTap: () => context.push(HistoryPage.route),
                  child: const Icon(Icons.history)))
        ],
        automaticallyImplyLeading: false,
      );

  void _onValueChanged(val) {
    final DateTime currentTime = DateTime.now();

    _selectedSegmentNotifier.value = val;
    _selectedTimeNotifier.value = currentTime;

    addToHistory(
        WorldClass(worldType: WorldType.values[val], dateTime: currentTime));
  }
}
