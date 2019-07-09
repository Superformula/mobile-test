import 'package:flutter/foundation.dart';
import 'package:qr_generator/services/api_service.dart';

class Seed with ChangeNotifier {
  String _seed;
  DateTime _expiresAt;
  bool _busy = false;

  String get seed => _seed;
  DateTime get expiresAt => _expiresAt;
  bool get busy => _busy;

  void setSeed(String text) {
    _seed = text;
    notifyListeners();
  }

  void setExpiresAt(DateTime expiresAt) {
    _expiresAt = expiresAt;
    notifyListeners();
  }

  Seed({String seed, DateTime expiresAt}) {
    setSeed(seed);
    setExpiresAt(expiresAt);
  }

  Future<void> fetchSeed() async {
    _busy = true;
    notifyListeners();

    Map<String, dynamic> data = await ApiService.getSeed();
    _seed = data['seed'];
    _expiresAt = DateTime.parse(data['expires_at']);

    _busy = false;
    notifyListeners();
  }
}
