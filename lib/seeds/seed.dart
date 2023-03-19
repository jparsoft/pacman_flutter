
import 'package:flutter/material.dart';

class SeedWidget extends StatelessWidget {
  const SeedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
            child: const Text(''),
          ),
      ),
    );
  }
}
