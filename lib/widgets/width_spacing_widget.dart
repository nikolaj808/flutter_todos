import 'package:flutter/material.dart';
import 'package:flutter_todos/constants/spacing.dart';

class WidthSpacing extends StatelessWidget {
  final double width;

  /// WidthSpacing widget with a custom width
  const WidthSpacing({
    super.key,
    required this.width,
  });

  /// WidthSpacing.xs: 4.0
  const WidthSpacing.xs({
    super.key,
  }) : width = kSpacingExtraSmall;

  /// WidthSpacing.sm: 8.0
  const WidthSpacing.sm({
    super.key,
  }) : width = kSpacingSmall;

  /// WidthSpacing.md: 16.0
  const WidthSpacing.md({
    super.key,
  }) : width = kSpacingMedium;

  /// WidthSpacing.lg: 32.0
  const WidthSpacing.lg({
    super.key,
  }) : width = kSpacingLarge;

  /// WidthSpacing.xl: 48.0
  const WidthSpacing.xl({
    super.key,
  }) : width = kSpacingExtraLarge;

  /// WidthSpacing.xxl: 64.0
  const WidthSpacing.xxl({
    super.key,
  }) : width = kSpacingExtraExtraLarge;

  /// WidthSpacing.xxxl: 96.0
  const WidthSpacing.xxxl({
    super.key,
  }) : width = kSpacingExtraExtraExtraLarge;

  /// WidthSpacing.xxxxl: 128.0
  const WidthSpacing.xxxxl({
    super.key,
  }) : width = kSpacingExtraExtraExtraExtraLarge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
