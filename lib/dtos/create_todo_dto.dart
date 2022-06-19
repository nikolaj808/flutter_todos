import 'package:equatable/equatable.dart';

class CreateTodo extends Equatable {
  final String title;

  const CreateTodo({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}
