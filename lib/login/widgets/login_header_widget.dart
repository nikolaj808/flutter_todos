import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let\'s sign you in.',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
