class Seed {
  bool success = true;
  String seed;
  int expiresAt;

  Seed.success(this.seed, this.expiresAt);

  Seed.failure() {
    success = false;
  }
}