import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dukka_samasys/utils/colors.dart';

//The are helpers which here is the toast message to avoid repetition
showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

