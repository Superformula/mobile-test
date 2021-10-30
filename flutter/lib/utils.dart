//Flutter Packages
import 'package:flutter/material.dart';

//Third party packages
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSuccess(BuildContext context, String message) {
  showTopSnackBar(context, CustomSnackBar.success(message: message),displayDuration: Duration(seconds: 3));
}

void showError(BuildContext context, String message) {
  showTopSnackBar(context, CustomSnackBar.error(message: message),displayDuration: Duration(seconds: 3));
}

void showInfo(BuildContext context, String message) {
  showTopSnackBar(context, CustomSnackBar.info(message: message),displayDuration: Duration(seconds: 3));
}

void showLoader(){
  EasyLoading.show(
    //status: 'Processing...',
    maskType: EasyLoadingMaskType.black,
  );
}

void hideLoader(){
  EasyLoading.dismiss();
}

bool isLoaderShowing(){
  return EasyLoading.isShow;
}