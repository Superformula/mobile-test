/// The Options class represents variables that the application uess throughout.
/// In a production application, these values might change depending on user
/// input and may need to be persisted using a file or db store. For this app,
/// we are using constant values to represent options as there are no
/// configurable values set.
/// The application uses a Singleton because there should only be ONE Option
/// object within the application.
class Options {
  static final Options instance = Options._();

  Options._();

  /// The baseUrl represents the URL where the seed server is running.
  String get baseUrl => 'http://10.10.10.50';
}
