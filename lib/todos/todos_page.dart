import 'package:flutter/material.dart';

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
    );
  }
}
