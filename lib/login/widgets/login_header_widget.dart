import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let\'s sign you in.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
