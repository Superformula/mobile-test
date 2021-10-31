//Flutter packages
import 'package:flutter/material.dart';
import 'dart:convert';

//Third party packages
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

//My Packages
import '../values.dart' as values;
import '../utils.dart';

enum DOWNLOAD_STATE{
  DOWNLOADING,
  DOWNLOADED,
  ERROR,
}

class SuperFormulaProvider with ChangeNotifier{

  //Object declarations

  DOWNLOAD_STATE qrCodeDownloadingState = DOWNLOAD_STATE.DOWNLOADING;

  String _seed = "";

  String get seed{
    return _seed;
  }

  //Network Functions

  Dio dio = Dio(BaseOptions(
    baseUrl: values.baseUrl,
    connectTimeout: 8000,
    receiveTimeout: 8000,
  ));

  Future getSeed({required bool firstTime,required BuildContext context}) async{

    print("Getting seed");

    qrCodeDownloadingState = DOWNLOAD_STATE.DOWNLOADING;

    try {
      var response = await dio.request(
        "/seed",
        options: Options(method: 'GET'),
      );

      //Hide the loader
      qrCodeDownloadingState = DOWNLOAD_STATE.DOWNLOADED;

      print("RESPONSE:" + response.toString());

      if (response.statusCode == 200) {


        var decodedResponse = json.decode(response.toString()) as Map<
            String,
            dynamic>;

        _seed = decodedResponse["seed"].toString();
        notifyListeners();

        storeSeedOffline(_seed);

        if(!firstTime) {
          showSuccess(context, "QR Code Updated");
        }
      }
      else {
        qrCodeDownloadingState = DOWNLOAD_STATE.ERROR;
        showError(context, "Failed getting seed");
      }
    }
    on DioError catch(e){
      qrCodeDownloadingState = DOWNLOAD_STATE.ERROR;
      hideLoader();
      if(e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout){
        showError(context, "Internal server error");
      }
      else {
        showError(context, "No Internet connection!!! Please connect a network");
      }
    }
  }

  Future verifySeed({required String seed,required BuildContext context,required Function showValidDialog,required Function showInvalidDialog}) async{

    print("Verify seed");

    //Show the loader
    showLoader();

    final body = json.encode({
      "seed" : seed,
    });


    try {
      var response = await dio.request(
        "/verify-seed",
        data: body,
        options: Options(method: 'POST'),
      );

      //Hide the loader
      hideLoader();

      print("RESPONSE:" + response.toString());

      var decodedResponse = json.decode(response.toString()) as Map<
          String,
          dynamic>;

      if (response.statusCode == 200) {

        String _status = decodedResponse["status"].toString();

        if(_status == "valid") {
          showValidDialog();
        } else {
          showInvalidDialog();
        }
      }
      else {
        if(decodedResponse['message']!=null) {
          showError(context, decodedResponse['message']);
        }
        else{
          showError(context, 'Error verifying QRCode. Please try Again!');
        }
      }
    }
    on DioError catch(e){
      hideLoader();
      if(e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout){
        showError(context, "Internal server error");
      }
      else {
        print(e.message);
        showError(context, e.message);
      }
    }
  }

  void storeSeedOffline(String seed) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(values.SEED_KEY, seed);
  }

  //Test Functions
  bool isSeedValidTest = false;

  Future verifySeedTest({required String seed}) async{

    final body = json.encode({
      "seed" : seed,
    });


    try {
      var response = await dio.request(
        "/verify-seed",
        data: body,
        options: Options(method: 'POST'),
      );

      var decodedResponse = json.decode(response.toString()) as Map<
          String,
          dynamic>;

      if (response.statusCode == 200) {

        String _status = decodedResponse["status"].toString();

        if(_status == "valid") {
          isSeedValidTest = true;
        } else {
          isSeedValidTest = false;
        }
      }
      else {
        if(decodedResponse['message']!=null) {
          isSeedValidTest = false;
        }
        else{
          isSeedValidTest = false;
        }
      }
    }
    on DioError catch(e){
      if(e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout){
        return false;
      }
      else {
        return false;
      }
    }
  }

  Future<String> getSeedTest() async {
    var response = await dio.request(
      "/seed",
      options: Options(method: 'GET'),
    );


    if (response.statusCode == 200) {
      var decodedResponse = json.decode(response.toString()) as Map<
          String,
          dynamic>;

      return(decodedResponse["seed"]);
    }
    else{
      return "";
    }
  }
}