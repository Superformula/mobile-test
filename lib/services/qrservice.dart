import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qrapp/models/downloadstatus.dart';
import 'package:qrapp/models/seed.dart';
import 'package:qrapp/models/seedstatus.dart';
import 'package:qrapp/utils.dart';
import 'package:qrapp/values.dart' as vals;

class QRService extends ChangeNotifier {
  SeedModel? _seed;
  SeedStatus _seedVerified = SeedStatus.NONE;
  DownloadStatus _downloadStatus = DownloadStatus.DOWNLOADING;
  bool _qrScanning = true;

  Dio dio = Dio(
    BaseOptions(
        baseUrl: vals.baseApiURL,
        connectTimeout: 15 * 1000,
        receiveTimeout: 15 * 1000,
        headers: {'x-api-key': 'VVTUTAdalB55yRKQzsM7u6RTowrcUUhJLA82hoN6'}),
  );

  SeedModel? get seed => _seed;
  SeedStatus get seedStatus => _seedVerified;
  DownloadStatus get seedDownloadStatus => _downloadStatus;
  bool get isQRScanning => _qrScanning;

  Future getSeed(BuildContext context) async {
    try {
      _downloadStatus = DownloadStatus.DOWNLOADING;

      //Call to server
      var response = await dio.get('/default/random-qr-seed_seed');

      //Handle Success
      if (response.statusCode == 200) {
        _downloadStatus = DownloadStatus.DOWNLOADED;

        _seed = SeedModel.fromJson(json.decode(response.toString()));
        _seedVerified = SeedStatus.DOWNLOADED;
        notifyListeners();
      } else {
        _downloadStatus = DownloadStatus.ERROR;
        showError(context, response.statusMessage.toString());
        notifyListeners();
      }
    } on DioError catch (e) {
      showError(context, e.toString());
    }
  }

  Future verifySeed(BuildContext context, String data) async {
    try {
      _seed = SeedModel.fromJson(json.decode(data.toString()));

      if (DateTime.now().toUtc().isBefore(_seed!.expiresAt) == true) {
        _seedVerified = SeedStatus.VERIFIED;
      } else if (DateTime.now().toUtc().isBefore(_seed!.expiresAt) == false) {
        _seedVerified = SeedStatus.OUTDATEDED;
      } else {
        _seedVerified = SeedStatus.ERROR;
      }
      _qrScanning = false;

      notifyListeners();
    } catch (e) {
      showError(context, e.toString());
      _seedVerified = SeedStatus.ERROR;
      notifyListeners();
    }
  }

  void retryScan() async {
    _seedVerified = SeedStatus.NONE;
    _seed = null;
    _downloadStatus = DownloadStatus.DOWNLOADING;
    _qrScanning = true;
    notifyListeners();
  }
}
