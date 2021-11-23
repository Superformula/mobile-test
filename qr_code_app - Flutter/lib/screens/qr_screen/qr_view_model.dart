import 'package:flutter/cupertino.dart';
import 'package:qr_generator/models/seed.dart';
import 'package:qr_generator/providers/general.dart';
import 'package:qr_generator/screens/qr_screen/qr_repository.dart';

class QrViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Seed? _seedResponse;

  bool get isLoading => _isLoading;
  Seed? get seedResponse => _seedResponse;

  Future<void> getSeed(General general) async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _isLoading = true;
      notifyListeners();
    });

    try {
      _seedResponse = await QrRepository().getSeed(general);
    } catch (exception) {
      _seedResponse = null;
    }

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _isLoading = false;
      notifyListeners();
    });
  }

  clearData() {
    _isLoading = false;
  }
}
