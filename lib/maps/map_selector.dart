import 'package:tetris/maps/level_entity.dart';
import 'package:tetris/maps/maps_list.dart';
 
LevelEntity getLevelMap({required int levelNumber}) {
  return mapsList.firstWhere((map) => map.level == '$levelNumber');
}
