part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailInputChanged extends LoginEvent {
  final EmailInput emailInput;

  const LoginEmailInputChanged({
    required this.emailInput,
  });

  @override
  List<Object> get props => [emailInput.value];
}

class LoginPasswordInputChanged extends LoginEvent {
  final PasswordInput passwordInput;

  const LoginPasswordInputChanged({
    required this.passwordInput,
  });

  @override
  List<Object> get props => [passwordInput.value];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
