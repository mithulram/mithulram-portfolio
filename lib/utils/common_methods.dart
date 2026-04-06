
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CommonMethods {
  showSuccessToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.green.shade300,  // Success color
      textColor: Colors.white,
      fontSize: 22,
    );
  }

  showDangerToast(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 2,// Success color
      textColor: Colors.white,
      fontSize: 22,
      webBgColor: "#FF7F7F"
    );
  }
}