import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color secondary;

  ColorExtension({required this.secondary});

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (t < 0.5 || other == null) return this;
    return other;
  }

  @override
  ColorExtension copyWith({
    Color? secondary,
  }) {
    return ColorExtension(
      secondary: secondary ?? this.secondary,
    );
  }
}
