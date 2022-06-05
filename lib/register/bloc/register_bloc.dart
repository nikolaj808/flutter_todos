import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/input/email_input.dart';
import 'package:flutter_todos/input/password_input.dart';
import 'package:flutter_todos/repositories/authentication_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository _authenticationRepository;

  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const RegisterInitial(
            emailInput: EmailInput.pure(),
            passwordInput: PasswordInput.pure(),
            confirmPasswordInput: PasswordInput.pure(),
          ),
        ) {
    on<RegisterEmailInputChanged>(
      _onRegisterEmailInputChangedEvent,
    );
    on<RegisterPasswordInputChanged>(
      _onRegisterPasswordInputChangedEvent,
    );
    on<RegisterConfirmPasswordInputChanged>(
      _onRegisterConfirmPasswordInputChangedEvent,
    );
    on<RegisterButtonPressed>(
      _onRegisterButtonPressedEvent,
    );
  }

  void _onRegisterEmailInputChangedEvent(
    RegisterEmailInputChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      emailInput: event.emailInput,
    ));
  }

  void _onRegisterPasswordInputChangedEvent(
    RegisterPasswordInputChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      passwordInput: event.passwordInput,
    ));
  }

  void _onRegisterConfirmPasswordInputChangedEvent(
    RegisterConfirmPasswordInputChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      confirmPasswordInput: event.confirmPasswordInput,
    ));
  }

  Future<void> _onRegisterButtonPressedEvent(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    final currentState = state.copyWith();

    emit(RegisterInProgress(
      emailInput: currentState.emailInput,
      passwordInput: currentState.passwordInput,
      confirmPasswordInput: currentState.confirmPasswordInput,
    ));

    try {
      await _authenticationRepository.registerUserWithEmailAndPassword(
        event.email,
        event.password,
      );

      emit(RegisterSuccess(
        emailInput: currentState.emailInput,
        passwordInput: currentState.passwordInput,
        confirmPasswordInput: currentState.confirmPasswordInput,
      ));
    } catch (error, stackTrace) {
      emit(RegisterFailure(
        error: error,
        emailInput: currentState.emailInput,
        passwordInput: currentState.passwordInput,
        confirmPasswordInput: currentState.confirmPasswordInput,
      ));

      emit(RegisterInitial(
        emailInput: currentState.emailInput,
        passwordInput: currentState.passwordInput,
        confirmPasswordInput: currentState.confirmPasswordInput,
      ));

      addError(error, stackTrace);
    }
  }
}
