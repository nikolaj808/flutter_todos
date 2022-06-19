import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/blocs/user/user_bloc.dart';
import 'package:flutter_todos/login/login_page.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
  });

  void onSignOutPressed(BuildContext context) {
    FirebaseAuth.instance.signOut();

    Navigator.of(context).pushAndRemoveUntil(
      LoginPage.route(),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        top: false,
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
            ListTile(
              title: const Text(
                'Sign Out',
                style: TextStyle(color: Colors.red),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onTap: () => onSignOutPressed(context),
            ),
          ],
        ),
      ),
    );
  }
}
