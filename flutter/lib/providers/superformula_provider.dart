//Flutter packages
import 'dart:convert';
//Third party packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//My Packages
import '../utils.dart';
import '../values.dart' as values;

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

    //Change state to downloading
    qrCodeDownloadingState = DOWNLOAD_STATE.DOWNLOADING;

    try {

      //Execute the network call
      var response = await dio.request(
        "/seed",
        options: Options(method: 'GET'),
      );

      //Hide the loader
      qrCodeDownloadingState = DOWNLOAD_STATE.DOWNLOADED;

      //Handle Success
      if (response.statusCode == 200) {

        //Decode the JSON
        var decodedResponse = json.decode(response.toString()) as Map<
            String,
            dynamic>;

        //Get the seed value
        _seed = decodedResponse["seed"].toString();
        notifyListeners();

        //Store seed value in shared preferences cache
        storeSeedOffline(_seed);

        //Show the toast only when the seed is refreshed and not the first time
        if(!firstTime) {
          showSuccess(context, "QR Code Updated");
        }
      }
      else {
        //Error handling
        qrCodeDownloadingState = DOWNLOAD_STATE.ERROR;
        showError(context, "Failed getting seed");
      }
    }
    on DioError catch(e){
      //Handle Dio Errors
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

    //Show the loader
    showLoader();

    //Input JSON parameter
    final body = json.encode({
      "seed" : seed,
    });

    try {

      //Execute the network call
      var response = await dio.request(
        "/verify-seed",
        data: body,
        options: Options(method: 'POST'),
      );

      //Hide the loader
      hideLoader();

      //Decode the JSON
      var decodedResponse = json.decode(response.toString()) as Map<
          String,
          dynamic>;

      if (response.statusCode == 200) {

        //Handle success
        String _status = decodedResponse["status"].toString();

        if(_status == "valid") {
          //Handle valid seed
          showValidDialog();
        } else {
          //Handle invalid seed
          showInvalidDialog();
        }
      }
      else {
        //Error handling
        if(decodedResponse['message']!=null) {
          showError(context, decodedResponse['message']);
        }
        else{
          showError(context, 'Error verifying QRCode. Please try Again!');
        }
      }
    }
    on DioError catch(e){
      //Handle Dio Errors
      hideLoader();
      if(e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout){
        showError(context, "Internal server error");
      }
      else {
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