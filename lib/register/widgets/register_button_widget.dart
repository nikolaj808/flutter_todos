import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/register/bloc/register_bloc.dart';

class RegisterButton extends StatelessWidget {
  final void Function(BuildContext context) onRegisterPressed;

  const RegisterButton({
    Key? key,
    required this.onRegisterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is RegisterInProgress
              ? () {}
              : () => onRegisterPressed(context),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48.0),
          ),
          child: Builder(builder: (context) {
            if (state is RegisterInProgress) {
              return CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              );
            }

            return const Text('Register');
          }),
        );
      },
    );
  }
}
