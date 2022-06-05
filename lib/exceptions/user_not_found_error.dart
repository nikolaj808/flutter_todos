class UserNotFoundError implements Exception {
  final String message;

  const UserNotFoundError([
    this.message = 'No user found for that email',
  ]);

  @override
  String toString() {
    return message;
  }
}
