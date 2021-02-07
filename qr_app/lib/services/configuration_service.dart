import 'package:qr_app/utils/mock_data_generator.dart';

class ConfigurationService {
  String get host => 'http/test.com';
  bool get loadMockData => true;
  MockDataGenerator get mockDataGenerator => MockDataGenerator();
}
