import 'package:formz/formz.dart';

enum PasswordInputError {
  empty;

  @override
  String toString() {
    switch (this) {
      case PasswordInputError.empty:
        return 'Password field cannot be empty';
    }
  }
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordInputError? validator(String value) {
    return value.isNotEmpty ? null : PasswordInputError.empty;
  }
}
