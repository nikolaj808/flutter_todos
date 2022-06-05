class WrongPasswordError implements Exception {
  final String message;

  const WrongPasswordError([
    this.message = 'Wrong password provided for that user',
  ]);

  @override
  String toString() {
    return message;
  }
}
