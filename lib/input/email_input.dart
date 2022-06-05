import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

enum EmailInputError {
  empty,
  invalidEmail;

  @override
  String toString() {
    switch (this) {
      case EmailInputError.empty:
        return 'Email field cannot be empty';
      case EmailInputError.invalidEmail:
        return 'A valid email is required';
    }
  }
}

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');

  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) {
      return EmailInputError.empty;
    }

    if (!EmailValidator.validate(value)) {
      return EmailInputError.invalidEmail;
    }

    return null;
  }
}
