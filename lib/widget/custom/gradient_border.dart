import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget content;
  final Color color;
  final double radius;
  final double borderWidth;
  final Gradient borderGradient;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final bool? allowTop;
  final bool? allowLeft;
  final bool? allowBottom;
  final bool? allowRight;

  const GradientBorderContainer({
    required this.content,
    required this.borderGradient,
    super.key,
    this.color = Colors.black,
    this.radius = 0.0,
    this.borderWidth = 1.0,
    this.margin,
    this.contentPadding,
    this.allowTop = true,
    this.allowLeft = true,
    this.allowBottom = true,
    this.allowRight = true,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(
        top: allowTop == true ? 1 : 0,
        left: allowLeft == true ? 1 : 0,
        bottom: allowBottom == true ? 1 : 0,
        right: allowRight == true ? 1 : 0,
      ),
      decoration: BoxDecoration(
        gradient: borderGradient,
        borderRadius: _getBorderRadius(),
      ),
      child: Container(
        padding: contentPadding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: _getBorderRadius(),
        ),
        child: content,
      ),
    );
  }

  BorderRadius _getBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
    );
  }
}
