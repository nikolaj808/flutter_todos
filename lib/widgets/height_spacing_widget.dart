import 'package:flutter/material.dart';
import 'package:flutter_todos/constants/spacing.dart';

class HeightSpacing extends StatelessWidget {
  final double height;

  /// HeightSpacing widget with a custom height
  const HeightSpacing({
    Key? key,
    required this.height,
  }) : super(key: key);

  const HeightSpacing.xs({Key? key})
      : height = kSpacingExtraSmall,
        super(key: key);

  const HeightSpacing.sm({Key? key})
      : height = kSpacingSmall,
        super(key: key);

  const HeightSpacing.md({Key? key})
      : height = kSpacingMedium,
        super(key: key);

  const HeightSpacing.lg({Key? key})
      : height = kSpacingLarge,
        super(key: key);

  const HeightSpacing.xl({Key? key})
      : height = kSpacingExtraLarge,
        super(key: key);

  const HeightSpacing.xxl({Key? key})
      : height = kSpacingExtraExtraLarge,
        super(key: key);

  const HeightSpacing.xxxl({Key? key})
      : height = kSpacingExtraExtraExtraLarge,
        super(key: key);

  const HeightSpacing.xxxxl({Key? key})
      : height = kSpacingExtraExtraExtraExtraLarge,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
