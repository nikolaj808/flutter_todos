import 'package:flutter/material.dart';
import 'package:flutter_todos/constants/spacing.dart';

class HeightSpacing extends StatelessWidget {
  final double height;

  /// HeightSpacing widget with a custom height
  const HeightSpacing({
    super.key,
    required this.height,
  });

  /// HeightSpacing.xs: 4.0
  const HeightSpacing.xs({
    super.key,
  }) : height = kSpacingExtraSmall;

  /// HeightSpacing.xs: 8.0
  const HeightSpacing.sm({
    super.key,
  }) : height = kSpacingSmall;

  /// HeightSpacing.xs: 16.0
  const HeightSpacing.md({
    super.key,
  }) : height = kSpacingMedium;

  /// HeightSpacing.xs: 32.0
  const HeightSpacing.lg({
    super.key,
  }) : height = kSpacingLarge;

  /// HeightSpacing.xs: 48.0
  const HeightSpacing.xl({
    super.key,
  }) : height = kSpacingExtraLarge;

  /// HeightSpacing.xs: 64.0
  const HeightSpacing.xxl({
    super.key,
  }) : height = kSpacingExtraExtraLarge;

  /// HeightSpacing.xs: 96.0
  const HeightSpacing.xxxl({
    super.key,
  }) : height = kSpacingExtraExtraExtraLarge;

  /// HeightSpacing.xs: 128.0
  const HeightSpacing.xxxxl({
    super.key,
  }) : height = kSpacingExtraExtraExtraExtraLarge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
