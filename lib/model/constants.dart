import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['BASE_URL']!;
String apiKey = dotenv.env['API_KEY']!;
String testUrl = dotenv.env['TEST_URL']!;
String testKey = dotenv.env['API_TEST_KEY']!;
