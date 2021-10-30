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

  Future getSeed({required BuildContext context}) async{

    print("Getting seed");

    //Show the loader
    showLoader();

    final header = {
      "content-type": "application/json",
    };


    try {
      var response = await dio.request(
        "/seed",
        options: Options(method: 'GET', headers: header),
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
        showSuccess(context, "QR Code Updated");
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
}