import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/dtos/create_todo_dto.dart';
import 'package:flutter_todos/dtos/update_todo_dto.dart';
import 'package:flutter_todos/models/todo_model.dart';
import 'package:flutter_todos/repositories/todos_repository.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  StreamSubscription<List<Todo>>? _todosSubscription;

  final TodosRepository _todosRepository;

  TodosBloc({
    required TodosRepository todosRepository,
  })  : _todosRepository = todosRepository,
        super(const TodosInitial()) {
    on<TodosStartListening>(
      _onTodosStartListeningEvent,
    );
    on<TodosCreate>(
      _onTodosCreateEvent,
    );
    on<TodosUpdate>(
      _onTodosUpdateEvent,
    );
    on<TodosDelete>(
      _onTodosDeleteEvent,
    );
    on<TodosUpdatedList>(
      _onTodosUpdatedListEvent,
    );
    on<TodosError>(
      _onTodosErrorEvent,
    );
  }

  void _onTodosStartListeningEvent(
    TodosStartListening event,
    Emitter<TodosState> emit,
  ) {
    emit(const TodosGetInProgress());

    _todosSubscription = _todosRepository.getTodosStream().listen(
          (todos) => add(TodosUpdatedList(todos: todos)),
          onError: (error) => add(TodosError(message: error.toString())),
          onDone: () => _todosSubscription?.cancel(),
        );
  }

  void _onTodosCreateEvent(
    TodosCreate event,
    Emitter<TodosState> emit,
  ) {
    _todosRepository.addTodo(event.createTodo);
  }

  void _onTodosUpdateEvent(
    TodosUpdate event,
    Emitter<TodosState> emit,
  ) {
    _todosRepository.updateTodo(event.updateTodo);
  }

  void _onTodosDeleteEvent(
    TodosDelete event,
    Emitter<TodosState> emit,
  ) {
    _todosRepository.deleteTodo(event.id);
  }

  void _onTodosUpdatedListEvent(
    TodosUpdatedList event,
    Emitter<TodosState> emit,
  ) {
    emit(TodosGetSuccess(
      todos: event.todos,
    ));
  }

  void _onTodosErrorEvent(
    TodosError event,
    Emitter<TodosState> emit,
  ) {
    emit(TodosGetFailure(
      message: event.message,
    ));
  }

  @override
  Future<void> close() async {
    await _todosSubscription?.cancel();

    return super.close();
  }
}
