import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final VoidCallback action;
  final double height; // <-- new parameter
  const AnimatedButton({
    super.key,
    required this.text,
    required this.action,
    this.height = 50, // default height
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<double> tween;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    tween = Tween<double>(begin: 0, end: 1);
    animation = controller.drive(tween);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity, 
        height: widget.height, 
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return TextButton(
              onPressed: widget.action,
              style: TextButton.styleFrom(
                shape: DecoratedOutlinedBorder(
                  shadow: [
                    GradientShadow(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: _generateGradientColors(animation.value),
                        stops: _generateGradientStops(),
                      ),
                      offset: const Offset(-4, 4),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                  child: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Color> _generateGradientColors(double t) {
    return [
      Color.lerp(
        const Color.fromARGB(255, 29, 38, 88),
        const Color.fromARGB(255, 60, 80, 146),
        t,
      )!,
      Color.lerp(const Color.fromARGB(255, 234, 132, 252), Colors.black, t)!,
    ];
  }

  List<double> _generateGradientStops() {
    return [0.0, 1.0];
  }
}
