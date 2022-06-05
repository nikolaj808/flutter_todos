part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();

  @override
  List<Object> get props => [];
}

class UserNotAuthenticated extends UserState {
  const UserNotAuthenticated();

  @override
  List<Object> get props => [];
}

class UserAuthenticated extends UserState {
  final User user;

  const UserAuthenticated({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
