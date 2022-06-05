import 'package:flutter/material.dart';
import 'package:flutter_todos/constants/spacing.dart';

class WidthSpacing extends StatelessWidget {
  final double width;

  /// WidthSpacing widget with a custom width
  const WidthSpacing({
    Key? key,
    required this.width,
  }) : super(key: key);

  const WidthSpacing.xs({Key? key})
      : width = kSpacingExtraSmall,
        super(key: key);

  const WidthSpacing.sm({Key? key})
      : width = kSpacingSmall,
        super(key: key);

  const WidthSpacing.md({Key? key})
      : width = kSpacingMedium,
        super(key: key);

  const WidthSpacing.lg({Key? key})
      : width = kSpacingLarge,
        super(key: key);

  const WidthSpacing.xl({Key? key})
      : width = kSpacingExtraLarge,
        super(key: key);

  const WidthSpacing.xxl({Key? key})
      : width = kSpacingExtraExtraLarge,
        super(key: key);

  const WidthSpacing.xxxl({Key? key})
      : width = kSpacingExtraExtraExtraLarge,
        super(key: key);

  const WidthSpacing.xxxxl({Key? key})
      : width = kSpacingExtraExtraExtraExtraLarge,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
