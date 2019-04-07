///
/// Contains information about the seed
///
class Seed {
  // defines whether the fetch from the server was successful
  bool success = true;
  // the actual seed value returned
  String seed;
  // the epoch which the seed expires
  int expiresAt;

  ///
  /// load a successful seed and it expiration time
  ///
  Seed.success(this.seed, this.expiresAt);

  ///
  /// mark the seed fetch as a failure
  ///
  Seed.failure() {
    success = false;
  }
}