import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todos/dtos/create_todo_dto.dart';
import 'package:flutter_todos/dtos/update_todo_dto.dart';
import 'package:flutter_todos/models/todo_model.dart';

class TodosRepository {
  static const String collectionName = 'todos';

  const TodosRepository();

  Stream<List<Todo>> getTodosStream() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Todo.fromFirestore(doc, null);
      }).toList();
    });
  }

  Future<Todo> addTodo(CreateTodo createTodo) async {
    final todoDocRef = await FirebaseFirestore.instance
        .collection(collectionName)
        .add(createTodo.toFirestore());

    final todoSnapshot = await todoDocRef.get();

    final createdTodo = Todo.fromFirestore(todoSnapshot, null);

    return createdTodo;
  }

  Future<void> updateTodo(UpdateTodo updateTodo) async {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(updateTodo.id)
        .update(updateTodo.toFirestore());
  }

  Future<void> deleteTodo(String id) async {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(id)
        .delete();
  }
}
