import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/login/bloc/login_bloc.dart';
import 'package:flutter_todos/login/widgets/login_button_widget.dart';
import 'package:flutter_todos/login/widgets/login_form_widget.dart';
import 'package:flutter_todos/login/widgets/login_header_widget.dart';
import 'package:flutter_todos/login/widgets/login_register_option_widget.dart';
import 'package:flutter_todos/repositories/authentication_repository.dart';
import 'package:flutter_todos/todos/todos_page.dart';
import 'package:flutter_todos/utilities/snack_bar_helper.dart';
import 'package:flutter_todos/widgets/height_spacing_widget.dart';

class LoginPage extends StatelessWidget {
  static Route route({
    Key? key,
  }) {
    return MaterialPageRoute<void>(
      builder: (context) => LoginPage(
        key: key,
      ),
    );
  }

  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationRepository: context.read<AuthenticationRepository>(),
      ),
      child: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginView({
    super.key,
  });

  void onLoginSuccess(BuildContext context) {
    Navigator.of(context).pushReplacement(TodosPage.route());
  }

  void onLoginFailure(BuildContext context, String error) {
    SnackBarHelper.showSnackBar(
      context: context,
      message: error,
      snackBarType: SnackBarType.error,
    );
  }

  void onLoginPressed(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final currentState = context.read<LoginBloc>().state.copyWith();

    final emailInput = currentState.emailInput;
    final passwordInput = currentState.passwordInput;

    context.read<LoginBloc>().add(
          LoginButtonPressed(
            email: emailInput.value,
            password: passwordInput.value,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          onLoginSuccess(context);
        }

        if (state is LoginFailure) {
          onLoginFailure(context, state.error.toString());
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kSpacingMedium),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LoginHeader(),
                  LoginForm(formKey: _formKey, onLoginPressed: onLoginPressed),
                  Column(
                    children: [
                      const LoginRegisterOption(),
                      const HeightSpacing.md(),
                      LoginButton(onLoginPressed: onLoginPressed),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
