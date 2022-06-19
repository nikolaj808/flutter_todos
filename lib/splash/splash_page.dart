import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/blocs/user/user_bloc.dart';
import 'package:flutter_todos/login/login_page.dart';
import 'package:flutter_todos/todos/todos_page.dart';

class SplashPage extends StatelessWidget {
  static Route route({
    Key? key,
  }) {
    return MaterialPageRoute<void>(
      builder: (context) => SplashPage(
        key: key,
      ),
    );
  }

  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  void onUserAuthenticated(BuildContext context) {
    Navigator.of(context).pushReplacement(TodosPage.route());
  }

  void onUserNotAuthenticated(BuildContext context) {
    Navigator.of(context).pushReplacement(LoginPage.route());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserAuthenticated) {
          onUserAuthenticated(context);
        }

        if (state is UserNotAuthenticated) {
          onUserNotAuthenticated(context);
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
