import 'package:flutter/material.dart';
import 'package:flutter_todos/register/register_page.dart';

class LoginRegisterOption extends StatelessWidget {
  const LoginRegisterOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Don\'t have an account? '),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              RegisterPage.route(),
            );
          },
          child: const Text(
            'Register',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
