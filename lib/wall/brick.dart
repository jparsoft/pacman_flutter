import 'package:flutter/material.dart';

class BrickWidget extends StatelessWidget {
  const BrickWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        color: Colors.blue[800],
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                ),
                child: const Text(''),
              ),
          ),
        ),
      ),
    );
  }
}