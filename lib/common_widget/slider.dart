import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final Duration currentPosition;
  final Duration totalDuration;

  SliderWidget({
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    required this.currentPosition,
    required this.totalDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _formatDuration(currentPosition),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
            activeColor: Colors.deepOrange,
            inactiveColor: Colors.grey,
            thumbColor: Colors.deepOrange,
          ),
        ),
        Text(
          _formatDuration(totalDuration),
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
