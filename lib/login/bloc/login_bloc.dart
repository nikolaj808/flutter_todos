import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/input/email_input.dart';
import 'package:flutter_todos/input/password_input.dart';
import 'package:flutter_todos/repositories/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const LoginInitial(
            emailInput: EmailInput.pure(),
            passwordInput: PasswordInput.pure(),
          ),
        ) {
    on<LoginEmailInputChanged>(
      _onLoginEmailInputChangedEvent,
    );
    on<LoginPasswordInputChanged>(
      _onLoginPasswordInputChangedEvent,
    );
    on<LoginButtonPressed>(
      _onLoginButtonPressedEvent,
    );
  }

  void _onLoginEmailInputChangedEvent(
    LoginEmailInputChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      emailInput: event.emailInput,
    ));
  }

  void _onLoginPasswordInputChangedEvent(
    LoginPasswordInputChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      passwordInput: event.passwordInput,
    ));
  }

  Future<void> _onLoginButtonPressedEvent(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    final currentState = state.copyWith();

    emit(LoginInProgress(
      emailInput: currentState.emailInput,
      passwordInput: currentState.passwordInput,
    ));

    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        event.email,
        event.password,
      );

      emit(LoginSuccess(
        emailInput: currentState.emailInput,
        passwordInput: currentState.passwordInput,
      ));
    } catch (error, stackTrace) {
      emit(LoginFailure(
        error: error,
        emailInput: currentState.emailInput,
        passwordInput: currentState.passwordInput,
      ));

      emit(LoginInitial(
        emailInput: currentState.emailInput,
        passwordInput: currentState.passwordInput,
      ));

      addError(error, stackTrace);
    }
  }
}
