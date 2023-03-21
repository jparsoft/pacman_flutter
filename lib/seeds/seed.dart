import 'package:flutter/material.dart';

class SeedWidget extends StatelessWidget {
  const SeedWidget({
    super.key,
    required this.color,
  });
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: const Text(''),
        ),
      ),
    );
  }
}
