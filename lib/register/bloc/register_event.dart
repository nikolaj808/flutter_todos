part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailInputChanged extends RegisterEvent {
  final EmailInput emailInput;

  const RegisterEmailInputChanged({
    required this.emailInput,
  });

  @override
  List<Object> get props => [emailInput.value];
}

class RegisterPasswordInputChanged extends RegisterEvent {
  final PasswordInput passwordInput;

  const RegisterPasswordInputChanged({
    required this.passwordInput,
  });

  @override
  List<Object> get props => [passwordInput.value];
}

class RegisterConfirmPasswordInputChanged extends RegisterEvent {
  final PasswordInput confirmPasswordInput;

  const RegisterConfirmPasswordInputChanged({
    required this.confirmPasswordInput,
  });

  @override
  List<Object> get props => [confirmPasswordInput.value];
}

class RegisterButtonPressed extends RegisterEvent {
  final String email;
  final String password;

  const RegisterButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
