part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserAppInitialized extends UserEvent {
  const UserAppInitialized();

  @override
  List<Object> get props => [];
}

class UserAuthStateChanged extends UserEvent {
  final User? user;

  const UserAuthStateChanged({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}
