import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/input/email_input.dart';
import 'package:flutter_todos/input/password_input.dart';
import 'package:flutter_todos/login/bloc/login_bloc.dart';
import 'package:flutter_todos/widgets/height_spacing_widget.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function(BuildContext context) onLoginPressed;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.onLoginPressed,
  });

  void onEmailChanged(BuildContext context, String email) {
    context.read<LoginBloc>().add(
          LoginEmailInputChanged(
            emailInput: EmailInput.dirty(
              value: email,
            ),
          ),
        );
  }

  void onPasswordChanged(BuildContext context, String password) {
    context.read<LoginBloc>().add(
          LoginPasswordInputChanged(
            passwordInput: PasswordInput.dirty(
              value: password,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BlocSelector<LoginBloc, LoginState, EmailInput>(
            selector: (state) => state.emailInput,
            builder: (context, emailInput) => TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) => onEmailChanged(context, email),
              validator: (_) =>
                  emailInput.valid ? null : emailInput.error?.toString(),
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const HeightSpacing.md(),
          BlocSelector<LoginBloc, LoginState, PasswordInput>(
            selector: (state) => state.passwordInput,
            builder: (context, passwordInput) => TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: true,
              onChanged: (password) => onPasswordChanged(context, password),
              validator: (_) =>
                  passwordInput.valid ? null : passwordInput.error?.toString(),
              onFieldSubmitted: (_) => onLoginPressed(context),
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
