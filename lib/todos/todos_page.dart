import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/blocs/user/user_bloc.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/login/login_page.dart';
import 'package:flutter_todos/widgets/user_drawer_widget.dart';

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
      drawer: const UserDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(kSpacingMedium),
      ),
    );
  }
}
