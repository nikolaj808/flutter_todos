part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosStartListening extends TodosEvent {
  const TodosStartListening();

  @override
  List<Object> get props => [];
}

class TodosCreate extends TodosEvent {
  final CreateTodo createTodo;

  const TodosCreate({
    required this.createTodo,
  });

  @override
  List<Object> get props => [createTodo];
}

class TodosUpdate extends TodosEvent {
  final UpdateTodo updateTodo;

  const TodosUpdate({
    required this.updateTodo,
  });

  @override
  List<Object> get props => [updateTodo];
}

class TodosDelete extends TodosEvent {
  final String id;

  const TodosDelete({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class TodosUpdatedList extends TodosEvent {
  final List<Todo> todos;

  const TodosUpdatedList({
    required this.todos,
  });

  @override
  List<Object> get props => [...todos];
}

class TodosError extends TodosEvent {
  final String message;

  const TodosError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
