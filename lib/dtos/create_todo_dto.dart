import 'package:equatable/equatable.dart';

class CreateTodo extends Equatable {
  final String title;
  final bool completed;

  const CreateTodo({
    required this.title,
    this.completed = false,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'completed': completed,
    };
  }

  @override
  List<Object> get props => [title, completed];
}
