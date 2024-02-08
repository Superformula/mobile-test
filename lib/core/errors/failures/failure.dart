abstract base class Failure {
  const Failure({required this.message});
  final String message;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Failure && other.message == message);
  }

  @override
  int get hashCode => message.hashCode;
}
