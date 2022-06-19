import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/constants/spacing.dart';
import 'package:flutter_todos/dtos/create_todo_dto.dart';
import 'package:flutter_todos/dtos/update_todo_dto.dart';
import 'package:flutter_todos/models/todo_model.dart';
import 'package:flutter_todos/repositories/todos_repository.dart';
import 'package:flutter_todos/todos/bloc/todos_bloc.dart';
import 'package:flutter_todos/widgets/height_spacing_widget.dart';
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
    return BlocProvider(
      create: (context) => TodosBloc(
        todosRepository: context.read<TodosRepository>(),
      )..add(const TodosStartListening()),
      child: const TodosView(),
    );
  }
}

class TodosView extends StatefulWidget {
  const TodosView({
    super.key,
  });

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  late TextEditingController _todosController;

  @override
  void initState() {
    super.initState();

    _todosController = TextEditingController();
  }

  @override
  void dispose() {
    _todosController.dispose();

    super.dispose();
  }

  void onTodoCreated(
    BuildContext context,
  ) {
    FocusScope.of(context).unfocus();

    if (_todosController.text.isEmpty) {
      return;
    }

    final createTodo = CreateTodo(
      title: _todosController.text,
    );

    context.read<TodosBloc>().add(TodosCreate(createTodo: createTodo));

    _todosController.clear();
  }

  void onTodoToggled(
    BuildContext context,
    Todo todo,
  ) {
    final updateTodo = UpdateTodo(
      id: todo.id,
      title: todo.title,
      completed: !todo.completed,
    );

    context.read<TodosBloc>().add(TodosUpdate(updateTodo: updateTodo));
  }

  void onTodoDeleted(
    BuildContext context,
    Todo todo,
  ) {
    context.read<TodosBloc>().add(TodosDelete(id: todo.id));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        drawer: const UserDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              const HeightSpacing.md(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kSpacingMedium),
                child: TextField(
                  onSubmitted: (_) => onTodoCreated(context),
                  controller: _todosController,
                  decoration: const InputDecoration(
                    hintText: 'What needs to be done?',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const HeightSpacing.md(),
              Expanded(
                child: BlocBuilder<TodosBloc, TodosState>(
                  builder: (context, state) {
                    if (state is TodosGetFailure) {
                      return Center(
                        child: Text(
                          'Failed to get tasks',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      );
                    }

                    if (state is TodosGetSuccess) {
                      final todos = state.todos;

                      return ListView.builder(
                        padding: const EdgeInsets.only(top: kSpacingSmall),
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos.elementAt(index);

                          return Dismissible(
                            key: Key(todo.id),
                            background: Container(
                              color: Theme.of(context).colorScheme.error,
                            ),
                            onDismissed: (_) => onTodoDeleted(context, todo),
                            child: CheckboxListTile(
                              onChanged: (_) => onTodoToggled(context, todo),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: todo.completed,
                              title: Text(
                                todo.title,
                              ),
                              subtitle: Text(
                                todo.completed.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
