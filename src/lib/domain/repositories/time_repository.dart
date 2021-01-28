abstract class TimeRepository {
  /// Get the current time from the most reliable source (phone, API, etc).
  Future<DateTime> getCurrentTime();
}
