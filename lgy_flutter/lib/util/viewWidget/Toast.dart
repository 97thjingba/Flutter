import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        // toast 在ios上面显示的秒数
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.purple,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void hideToast() {
    Fluttertoast.cancel();
  }
}
