part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final EmailInput emailInput;
  final PasswordInput passwordInput;

  const LoginState({
    required this.emailInput,
    required this.passwordInput,
  });

  LoginState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
  });

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
      ];
}

class LoginInitial extends LoginState {
  const LoginInitial({
    required super.emailInput,
    required super.passwordInput,
  });

  @override
  LoginInitial copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
  }) {
    return LoginInitial(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
      ];
}

class LoginInProgress extends LoginState {
  const LoginInProgress({
    required super.emailInput,
    required super.passwordInput,
  });

  @override
  LoginInProgress copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
  }) {
    return LoginInProgress(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
      ];
}

class LoginSuccess extends LoginState {
  const LoginSuccess({
    required super.emailInput,
    required super.passwordInput,
  });

  @override
  LoginSuccess copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
  }) {
    return LoginSuccess(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
      ];
}

class LoginFailure extends LoginState {
  final Object error;

  const LoginFailure({
    required this.error,
    required super.emailInput,
    required super.passwordInput,
  });

  @override
  LoginFailure copyWith({
    Object? error,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
  }) {
    return LoginFailure(
      error: error ?? this.error,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );
  }

  @override
  List<Object> get props => [
        error,
        emailInput.value,
        passwordInput.value,
      ];
}
