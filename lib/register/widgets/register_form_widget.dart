import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/input/email_input.dart';
import 'package:flutter_todos/input/password_input.dart';
import 'package:flutter_todos/register/bloc/register_bloc.dart';
import 'package:flutter_todos/widgets/height_spacing_widget.dart';

class RegisterForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final void Function(BuildContext context) onRegisterPressed;

  const RegisterForm({
    super.key,
    required this.formKey,
    required this.onRegisterPressed,
  });

  void onEmailChanged(BuildContext context, String email) {
    context.read<RegisterBloc>().add(
          RegisterEmailInputChanged(
            emailInput: EmailInput.dirty(
              value: email,
            ),
          ),
        );
  }

  void onPasswordChanged(BuildContext context, String password) {
    context.read<RegisterBloc>().add(
          RegisterPasswordInputChanged(
            passwordInput: PasswordInput.dirty(
              value: password,
            ),
          ),
        );
  }

  void onConfirmPasswordChanged(BuildContext context, String confirmPassword) {
    context.read<RegisterBloc>().add(
          RegisterConfirmPasswordInputChanged(
            confirmPasswordInput: PasswordInput.dirty(
              value: confirmPassword,
            ),
          ),
        );
  }

  String? validatePasswordAndConfirmPasswordIsEqual(
    PasswordInput passwordInput,
    PasswordInput confirmPasswordInput,
  ) {
    return passwordInput.value == confirmPasswordInput.value
        ? null
        : 'Password and confirm password fields must be equal';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BlocSelector<RegisterBloc, RegisterState, EmailInput>(
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
          BlocSelector<RegisterBloc, RegisterState, List<PasswordInput>>(
            selector: (state) =>
                [state.passwordInput, state.confirmPasswordInput],
            builder: (context, passwordInputs) => TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: true,
              onChanged: (password) => onPasswordChanged(context, password),
              validator: (_) {
                final passwordInput = passwordInputs.first;
                final confirmPasswordInput = passwordInputs.elementAt(1);

                final result = validatePasswordAndConfirmPasswordIsEqual(
                  passwordInput,
                  confirmPasswordInput,
                );

                if (result != null) {
                  return result;
                }

                return passwordInput.valid
                    ? null
                    : passwordInput.error?.toString();
              },
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const HeightSpacing.md(),
          BlocSelector<RegisterBloc, RegisterState, List<PasswordInput>>(
            selector: (state) =>
                [state.passwordInput, state.confirmPasswordInput],
            builder: (context, passwordInputs) => TextFormField(
              obscureText: true,
              onChanged: (confirmPassword) =>
                  onConfirmPasswordChanged(context, confirmPassword),
              validator: (_) {
                final passwordInput = passwordInputs.first;
                final confirmPasswordInput = passwordInputs.elementAt(1);

                final result = validatePasswordAndConfirmPasswordIsEqual(
                  passwordInput,
                  confirmPasswordInput,
                );

                if (result != null) {
                  return result;
                }

                return confirmPasswordInput.valid
                    ? null
                    : confirmPasswordInput.error?.toString();
              },
              onFieldSubmitted: (_) => onRegisterPressed(context),
              decoration: const InputDecoration(
                labelText: 'Confirm password',
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
