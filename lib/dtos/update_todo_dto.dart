import 'package:equatable/equatable.dart';

class UpdateTodo extends Equatable {
  final String id;
  final String title;
  final bool completed;

  const UpdateTodo({
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'completed': completed,
    };
  }

  @override
  List<Object> get props => [id, title, completed];
}
