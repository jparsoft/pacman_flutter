import 'package:flutter/material.dart';

class PlayerOneWidget extends StatelessWidget {
  const PlayerOneWidget({
    super.key,
    required this.color,
  });
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/player1.png'),
      ),
    );
  }
}
