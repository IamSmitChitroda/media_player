import 'package:flutter/material.dart';
import 'neumorphic_circle.dart';

class NeumorphicProgressView extends StatelessWidget {
  const NeumorphicProgressView({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    assert(0.0 <= progress && progress <= 1.0);

    return Stack(
      children: [
        Container(height: 66),
        Positioned(
          top: 30,
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(46, 52, 57, 1),
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: Container(
            width: 200 * progress,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(230, 59, 16, 1),
                  Colors.yellow,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 200 * progress - 25,
          top: 18,
          height: 35,
          child: NeumorphicCircleView(
            height: 15,
            width: 15,
            child: Icon(
              Icons.circle,
              size: 12,
              color: Colors.yellow,
            ),
          ),
        )
      ],
    );
  }
}
