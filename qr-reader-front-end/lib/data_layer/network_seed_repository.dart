import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:superformula/data_layer/qr_seed.dart';
import 'package:superformula/data_layer/seed_respository.dart';

class NetworkSeedRepository implements SeedRepository {
  final host = 'https://superformula-test.herokuapp.com';

  Future<QrSeed> fetchLatestSeed() async {
    final url = '$host/seed';

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      final seed = QrSeed.fromJson(data);
      return seed;
    } catch (e) {
      if (e is SocketException) {
        print('''
             Backend is not available.  
             Please run `aqueduct serve` in the qr_reader_backend folder to activate
             
             If you have not downloaded aqueduct, run `pub global activate aqueduct` first.''');
      }

      rethrow;
    }
  }
}
