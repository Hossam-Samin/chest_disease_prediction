import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// This function to display me a message when register and login
flutterToast({required String msg, required Color color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16,
  );
}

// This function use when change in border
OutlineInputBorder buildBorder({color}) {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.amber),
    borderRadius: BorderRadius.circular(16),
  );
}

// This function or method to display me message in app
void showSnackBar(BuildContext context, String messageSnackBar) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(messageSnackBar)));
}
