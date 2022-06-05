import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  StreamSubscription<User?>? _userStreamSubscription;

  UserBloc() : super(const UserInitial()) {
    on<UserAppInitialized>(
      _onUserAppInitializedEvent,
    );
    on<UserAuthStateChanged>(
      _onUserAuthStateChangedEvent,
    );
  }

  void _onUserAppInitializedEvent(
    UserAppInitialized event,
    Emitter<UserState> emit,
  ) {
    _userStreamSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((user) => add(UserAuthStateChanged(user: user)));
  }

  void _onUserAuthStateChangedEvent(
    UserAuthStateChanged event,
    Emitter<UserState> emit,
  ) {
    final user = event.user;

    if (user == null) {
      emit(const UserNotAuthenticated());
    } else {
      emit(UserAuthenticated(user: user));
    }
  }

  @override
  Future<void> close() async {
    await _userStreamSubscription?.cancel();

    return super.close();
  }
}
