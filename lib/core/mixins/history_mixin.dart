import 'package:switch_simple_project/core/classes/world_class.dart';

mixin HistoyMixin {
  static final Map<int, WorldClass> _historyMap = {};
  static Map<int, WorldClass> get historyMap => _historyMap;

  void addToHistory(WorldClass worldClass) =>
      _historyMap[_historyMap.length] = worldClass;

  void clearHistory() => _historyMap.clear();
}
