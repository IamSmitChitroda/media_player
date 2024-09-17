import 'package:flutter/material.dart';

class NeumorphicLoadingView extends StatefulWidget {
  const NeumorphicLoadingView({Key? key}) : super(key: key);

  @override
  _NeumorphicLoadingViewState createState() => _NeumorphicLoadingViewState();
}

class _NeumorphicLoadingViewState extends State<NeumorphicLoadingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return NeumorphicCircleProgressIndicator(
                progress: _controller.value,
              );
            },
          ),
        ),
      ),
    );
  }
}

class NeumorphicCircleProgressIndicator extends StatelessWidget {
  final double progress;

  const NeumorphicCircleProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 33, 36, 40),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            offset: const Offset(-4, -4),
            blurRadius: 8,
          ),
          // Dark shadow on bottom-right
          const BoxShadow(
            color: Colors.black54,
            offset: Offset(4, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 8,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
          ),
          // Inner text displaying percentage
          Text(
            "${(progress * 100).toInt()}%",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
