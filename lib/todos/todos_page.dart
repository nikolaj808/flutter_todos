import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data as User?;

                  if (user == null) {
                    return const ListTile(
                      title: Text('User'),
                      subtitle: Text('User is null'),
                    );
                  }

                  return ListTile(
                    title: const Text('User'),
                    subtitle: Text(user.email ?? ''),
                  );
                }

                return const CircularProgressIndicator();
              },
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();

                Navigator.of(context).pushAndRemoveUntil(
                  LoginPage.route(),
                  (route) => false,
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
