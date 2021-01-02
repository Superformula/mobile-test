/// The data source of the countdown timer. It's simply a stream that periodically
/// emits new values until the count arrives at zero.
class Counter {
  const Counter();

  /// Generates a new periodic stream that emits one value per second
  Stream<int> periodicStream(int totalSeconds) {
    return Stream.periodic(
        const Duration(seconds: 1), (value) => totalSeconds - value - 1)
        .take(totalSeconds);
  }
}