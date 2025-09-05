import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final bool useSafeArea;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const BackgroundGradient({
    super.key,
    required this.child,
    this.colors,
    this.useSafeArea = true,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = colors ?? [Colors.white, Color(0xFF42A5F5)];

    Widget content = Container(
      height: MediaQuery.of(context).size.height*1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: begin,
          end: end,
        ),
      ),
      child: child,
    );

    // Optionally wrap with SafeArea
    return useSafeArea ? SafeArea(child: content) : content;
  }
}
