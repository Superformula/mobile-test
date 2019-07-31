enum Flavor { develop, production }

Environment get env => _env;
Environment _env;

class Environment {
  final Flavor flavor;

  bool get isDevelop => flavor == Flavor.develop;

  bool get isProduction => flavor == Flavor.production;

  Environment._(this.flavor);

  /// Sets up the top-level [env] getter on the first call only.
  static void init(flavor) => _env = Environment._(flavor);
}
