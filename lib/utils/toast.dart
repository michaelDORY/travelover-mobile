import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  final Color color;
  final String message;

  CustomToast(
      {this.message = "Something went wrong",
      this.color = const Color.fromARGB(255, 255, 130, 121)});

  void show() {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        webPosition: "top",
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 16.0);
  }
}
