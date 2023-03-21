import 'package:flutter/material.dart';

class LevelEntity {
  final String level;
  final MaterialColor seedColor;
  final MaterialColor brickColor;
  final List<int> barriers;

  LevelEntity(
      {required this.level,
      required this.seedColor,
      required this.brickColor,
      required this.barriers});
}
