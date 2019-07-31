// Our core strings instance.
CoreStrings _strings;

///
/// The app should call this from its localization setup to set the core strings instance.
///
set coreStrings(CoreStrings strings) {
  _strings = strings;
}

///
/// Call this method from any layer to access strings.
///
CoreStrings get coreStrings {
  return _strings;
}

///
/// The app's localization object extends this class to provide string access.
///
abstract class CoreStrings {
  ///
  /// The app's locatization object must implement this method.
  ///
  String getString(String key);

  ///
  /// String accessors.
  ///

  String get appName => getString("appName");

  // We'll just reuse the appName for the home page title.
  String get homeTitle => appName;
}
