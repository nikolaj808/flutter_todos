import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/login/bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final void Function(BuildContext context) onLoginPressed;

  const LoginButton({
    Key? key,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed:
              state is LoginInProgress ? () {} : () => onLoginPressed(context),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(kSpacingExtraLarge),
          ),
          child: Builder(builder: (context) {
            if (state is LoginInProgress) {
              return CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              );
            }

            return const Text('Sign In');
          }),
        );
      },
    );
  }
}
