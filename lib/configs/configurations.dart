/// Utility class that centralizes the definition of parameters of the app
abstract class Configurations {

  /// The base endpoint at which the app has to make requests
  static const baseHttpEndpoint = "http://localhost:8075";

  /// The base endpoint at which the app has to make requests when using an
  /// Android simulator
  static const baseHttpEndpointAndroid = "http://10.0.2.2:8075";

}