class WeakPasswordError implements Exception {
  final String message;

  const WeakPasswordError([
    this.message = 'The password provided is too weak',
  ]);

  @override
  String toString() {
    return message;
  }
}
