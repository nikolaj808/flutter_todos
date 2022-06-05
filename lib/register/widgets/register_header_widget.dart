import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Let\'s get you registered.',
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
