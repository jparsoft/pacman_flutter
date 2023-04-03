import 'package:flutter/material.dart';
import 'package:tetris/maps/level_entity.dart';

import 'package:tetris/maps/map_selector.dart';
import 'package:tetris/players/player_1.dart';
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
  LevelEntity level = getLevelMap(levelNumber: 1);
  int playerOnePosition = 12;

  @override
  void initState() {
    super.initState();
   
  }

  void moveLeft() {
    if (playerOnePosition % numberInRow != 0 && level.barriers.contains(playerOnePosition - 1) == false) {
      setState(() {
        playerOnePosition--;
      });
    }
  }

  void moveRight() {
    if (playerOnePosition % numberInRow != numberInRow - 1 && level.barriers.contains(playerOnePosition + 1) == false) {
      setState(() {
        playerOnePosition++;
      });
    }
  }

  void moveUp() {
    if (playerOnePosition - numberInRow >= 0 && level.barriers.contains(playerOnePosition - numberInRow) == false) {
      setState(() {
        playerOnePosition -= numberInRow;
      });
    }
  }

  void moveDown() {
    if (playerOnePosition + numberInRow < numberOfSquare && level.barriers.contains(playerOnePosition + numberInRow) == false) {
      setState(() {
        playerOnePosition += numberInRow;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberOfSquare,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == playerOnePosition) {
                    return const PlayerOneWidget(color: Colors.red);
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: level.barriers.contains(index)
                          ? BrickWidget(color: level.brickColor)
                          : SeedWidget(color: level.seedColor),
                    );
                  }
                },
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                // buttons to move the player
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_upward),
                      onPressed: moveUp,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_downward),
                      onPressed: moveDown,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: moveLeft,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: moveRight,
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
