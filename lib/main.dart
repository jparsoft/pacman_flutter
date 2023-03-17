import 'package:flutter/material.dart';
import 'dart:math';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: numberOfSquare,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: numberInRow,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Text('$index'),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: Container(
                color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text('Score: 0'),
                )),
                Expanded(
                    child: Container(
                  child: Text('Level: 1'),
                )),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
