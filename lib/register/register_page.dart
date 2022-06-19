import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/register/bloc/register_bloc.dart';
import 'package:flutter_todos/register/widgets/register_button_widget.dart';
import 'package:flutter_todos/register/widgets/register_form_widget.dart';
import 'package:flutter_todos/register/widgets/register_header_widget.dart';
import 'package:flutter_todos/repositories/authentication_repository.dart';
import 'package:flutter_todos/todos/todos_page.dart';
import 'package:flutter_todos/utilities/snack_bar_helper.dart';

class RegisterPage extends StatelessWidget {
  static Route route({
    Key? key,
  }) {
    return MaterialPageRoute<void>(
      builder: (context) => RegisterPage(
        key: key,
      ),
    );
  }

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterView({
    super.key,
  });

  void onRegisterSuccess(BuildContext context) {
    SnackBarHelper.showSnackBar(
      context: context,
      message: 'User created',
      snackBarType: SnackBarType.success,
    );

    Navigator.of(context).pushAndRemoveUntil(
      TodosPage.route(),
      (route) => false,
    );
  }

  void onRegisterFailure(BuildContext context, String error) {
    SnackBarHelper.showSnackBar(
      context: context,
      message: error,
      snackBarType: SnackBarType.error,
    );
  }

  void onRegisterPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final currentState = context.read<RegisterBloc>().state.copyWith();

    final emailInput = currentState.emailInput;
    final passwordInput = currentState.passwordInput;

    context.read<RegisterBloc>().add(
          RegisterButtonPressed(
            email: emailInput.value,
            password: passwordInput.value,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          onRegisterSuccess(context);
        }

        if (state is RegisterFailure) {
          onRegisterFailure(context, state.error.toString());
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kSpacingMedium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RegisterHeader(),
                  RegisterForm(
                    formKey: _formKey,
                    onRegisterPressed: onRegisterPressed,
                  ),
                  RegisterButton(onRegisterPressed: onRegisterPressed),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
