import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_app/models/qr_code_data.dart';
import 'package:flutter_app/services/networking.dart';

mixin GenerateQRCodeDelegate {
  onSuccess(QRCodeData data);
  onFailure(String errorMessage);
}

class GenerateQRCodeViewModel {

  NetworkingService service;
  GenerateQRCodeDelegate _delegate;

  GenerateQRCodeViewModel({ @required this.service });

  Future<void> fetchQRCode(String text) async {
    try {
      var response = await service.get('/seed', { 'text': text });
      QRCodeData data = QRCodeData.fromJson(convert.jsonDecode(response.body));
      _delegate?.onSuccess(data);
    } catch(error) {
      _delegate?.onFailure(error.toString());
    }
  }

  void setDelegate(GenerateQRCodeDelegate delegate) {
    _delegate = delegate;
  }

}