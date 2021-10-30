//Flutter packages
import 'package:flutter/material.dart';
import 'dart:convert';

//Third party packages
import 'package:dio/dio.dart';

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

    //Show the loader
    showLoader();

    try {
      var response = await dio.request(
        "/seed",
        options: Options(method: 'GET'),
      );

      //Hide the loader
      hideLoader();

      print("RESPONSE:" + response.toString());

      if (response.statusCode == 200) {


        var decodedResponse = json.decode(response.toString()) as Map<
            String,
            dynamic>;

        _seed = decodedResponse["seed"].toString();
        notifyListeners();
        if(!firstTime) {
          showSuccess(context, "QR Code Updated");
        }
      }
      else {
        showError(context, "Failed getting seed");
      }
    }
    on DioError catch(e){
      hideLoader();
      if(e.type == DioErrorType.connectTimeout || e.type == DioErrorType.receiveTimeout || e.type == DioErrorType.sendTimeout){
        showError(context, "Internal server error");
      }
      else {
        showError(context, "No Internet connection!!! Please connect a network");
      }
    }
  }

  Future verifySeed({required String seed,required BuildContext context}) async{

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
          showSuccess(context, "Seed is valid");
        } else {
          showError(context, "Seed is invalid");
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
}