part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosInitial extends TodosState {
  const TodosInitial();

  @override
  List<Object> get props => [];
}

class TodosGetInProgress extends TodosState {
  const TodosGetInProgress();

  @override
  List<Object> get props => [];
}

class TodosGetSuccess extends TodosState {
  final List<Todo> todos;

  const TodosGetSuccess({
    required this.todos,
  });

  @override
  List<Object> get props => [...todos];
}

class TodosGetFailure extends TodosState {
  final String message;

  const TodosGetFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
