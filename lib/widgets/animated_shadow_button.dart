import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

class AnimatedShadowButton extends StatefulWidget {
  final String text;
  final VoidCallback action;
  const AnimatedShadowButton({
    super.key,
    required this.text,
    required this.action,
  });

  @override
  State<AnimatedShadowButton> createState() => _AnimatedShadowButtonState();
}

class _AnimatedShadowButtonState extends State<AnimatedShadowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Tween<double> tween;
  late Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    tween = Tween<double>(begin: 0, end: 1); // just 0–1 loop
    animation = controller.drive(tween);

    controller.repeat();
    super.initState();
  }

  List<Color> _generateGradientColors(double t) {
    return [
      Color.lerp(Colors.black, const Color.fromARGB(255, 60, 80, 146), t)!,
      Color.lerp(Colors.purple, Colors.black, t)!,
    ];
  }

  List<double> _generateGradientStops() {
    return [0.0, 1.0];
  }
}
