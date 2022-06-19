import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let\'s get you registered.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
