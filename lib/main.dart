import 'package:flutter/material.dart';
import 'package:tetris/maps/level_entity.dart';

import 'package:tetris/maps/map_selector.dart';
import 'package:tetris/wall/brick.dart';

import 'seeds/seed.dart';

void main() => runApp(const PacmanApp());

class PacmanApp extends StatelessWidget {
  const PacmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tetris',
      home: Scaffold(
        body: PacmanGame(),
      ),
    );
  }
}

class PacmanGame extends StatefulWidget {
  const PacmanGame({super.key});

  @override
  State<PacmanGame> createState() => _PacmanGameState();
}

class _PacmanGameState extends State<PacmanGame> {
  static int numberInRow = 11;
  int numberOfSquare = numberInRow * 17;
  LevelEntity level = getLevelMap(levelNumber: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: numberOfSquare,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numberInRow,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: level.barriers.contains(index)
                      ?  BrickWidget(color: level.brickColor)
                      :  SeedWidget(color: level.seedColor),
                );
              },
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: const Text('Score: 0'),
                )),
                Expanded(
                    child: Container(
                  child:  Text('Level: ${level.level}'),
                )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
