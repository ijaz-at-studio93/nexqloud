import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.blurAmount = 5.0,
    this.borderColor = Colors.transparent,
    this.borderRadius = 1000.0,
    this.borderWidth = 2.0,
    this.blurColorFilter = Colors.transparent,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double blurAmount;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final Color blurColorFilter;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: blurColorFilter.withOpacity(0.1),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
