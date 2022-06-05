class EmailAlreadyInUseError implements Exception {
  final String message;

  const EmailAlreadyInUseError([
    this.message = 'An account already exists for that email',
  ]);

  @override
  String toString() {
    return message;
  }
}
