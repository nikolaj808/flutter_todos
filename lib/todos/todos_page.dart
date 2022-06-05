import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/blocs/user/user_bloc.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/login/login_page.dart';

class TodosPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const TodosPage(),
    );
  }

  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TodosView();
  }
}

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  void onSignOutPressed(BuildContext context) {
    FirebaseAuth.instance.signOut();

    Navigator.of(context).pushAndRemoveUntil(
      LoginPage.route(),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserAuthenticated) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(state.user.email ?? ''),
                    accountEmail: const SizedBox.shrink(),
                    currentAccountPicture: const CircleAvatar(
                      child: Icon(Icons.person, size: 32),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            ElevatedButton(
              onPressed: () => onSignOutPressed(context),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(kSpacingExtraLarge),
                ),
                elevation: MaterialStateProperty.all<double>(0.0),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kSpacingMedium),
      ),
    );
  }
}
