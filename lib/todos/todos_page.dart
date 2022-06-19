import 'package:flutter/material.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/widgets/user_drawer_widget.dart';

class TodosPage extends StatelessWidget {
  static Route route({
    Key? key,
  }) {
    return MaterialPageRoute<void>(
      builder: (context) => TodosPage(
        key: key,
      ),
    );
  }

  const TodosPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TodosView();
  }
}

class TodosView extends StatelessWidget {
  const TodosView({
    super.key,
  });

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
