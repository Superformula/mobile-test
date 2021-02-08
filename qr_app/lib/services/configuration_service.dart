import 'package:flutter_config/flutter_config.dart';

class ConfigurationService {
  String get host => FlutterConfig.get('host');
}
