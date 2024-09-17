import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicCircleView extends StatelessWidget {
  const NeumorphicCircleView({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    this.shape = NeumorphicShape.convex,
    this.color,
    this.borderWidth = 5.5,
    this.depth = 8,
    this.intensity = 0.7,
    this.borderColor = const Color.fromRGBO(46, 52, 57, 1),
    this.onPressed,
  });

  final Widget child;
  final double height;
  final double width;
  final double borderWidth;
  final Color borderColor;
  final double intensity;
  final Color? color;
  final double depth;
  final NeumorphicShape shape;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      drawSurfaceAboveChild: false,
      style: NeumorphicStyle(
        shadowDarkColor: Colors.black.withOpacity(0.8),
        shadowLightColor: const Color.fromARGB(255, 82, 82, 82),
        depth: depth,
        boxShape: const NeumorphicBoxShape.circle(),
        intensity: intensity,
        surfaceIntensity: 0.2,
        shape: NeumorphicShape.concave,
      ),
      child: NeumorphicButton(
        onPressed: () {
          (onPressed != null) ? onPressed!() : null;
        },
        style: NeumorphicStyle(
          boxShape: const NeumorphicBoxShape.circle(),
          color: color ?? const Color.fromRGBO(29, 30, 36, 1),
          border: NeumorphicBorder(
            color: borderColor,
            width: borderWidth,
          ),
          depth: 0,
          shape: shape,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }
}
