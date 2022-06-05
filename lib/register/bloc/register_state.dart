part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  final EmailInput emailInput;
  final PasswordInput passwordInput;
  final PasswordInput confirmPasswordInput;

  const RegisterState({
    required this.emailInput,
    required this.passwordInput,
    required this.confirmPasswordInput,
  });

  RegisterState copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? confirmPasswordInput,
  });

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
        confirmPasswordInput.value,
      ];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial({
    required super.emailInput,
    required super.passwordInput,
    required super.confirmPasswordInput,
  });

  @override
  RegisterInitial copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? confirmPasswordInput,
  }) {
    return RegisterInitial(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
    );
  }

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
        confirmPasswordInput.value,
      ];
}

class RegisterInProgress extends RegisterState {
  const RegisterInProgress({
    required super.emailInput,
    required super.passwordInput,
    required super.confirmPasswordInput,
  });

  @override
  RegisterInProgress copyWith({
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? confirmPasswordInput,
  }) {
    return RegisterInProgress(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
    );
  }

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
        confirmPasswordInput.value,
      ];
}

class RegisterSuccess extends RegisterState {
  final UserCredential userCredentials;

  const RegisterSuccess({
    required this.userCredentials,
    required super.emailInput,
    required super.passwordInput,
    required super.confirmPasswordInput,
  });

  @override
  RegisterSuccess copyWith({
    UserCredential? userCredentials,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? confirmPasswordInput,
  }) {
    return RegisterSuccess(
      userCredentials: userCredentials ?? this.userCredentials,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
    );
  }

  @override
  List<Object> get props => [
        emailInput.value,
        passwordInput.value,
        confirmPasswordInput.value,
      ];
}

class RegisterFailure extends RegisterState {
  final Object error;

  const RegisterFailure({
    required this.error,
    required super.emailInput,
    required super.passwordInput,
    required super.confirmPasswordInput,
  });

  @override
  RegisterFailure copyWith({
    Object? error,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    PasswordInput? confirmPasswordInput,
  }) {
    return RegisterFailure(
      error: error ?? this.error,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
    );
  }

  @override
  List<Object> get props => [
        error,
        emailInput.value,
        passwordInput.value,
        confirmPasswordInput.value,
      ];
}
