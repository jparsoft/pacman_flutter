import 'package:tetris/maps/maps_list.dart';

List<int> getLevelMap({required int levelNumber}) {
  return mapsList.firstWhere((map) => map.level == '$levelNumber').barriers;
}
