import 'package:flutter/material.dart';

class CustomSnackbar {
  static snackbar(String text, BuildContext context,
      {Color? color, Color? textColor, Widget? widget}) {
    final snackBar = SnackBar(
      backgroundColor: color ?? Colors.grey,
      content: Row(
        children: [
          Expanded(
            child: Text(
              '$text ',
              style: TextStyle(color: textColor ?? Colors.black),
            ),
          ),
          widget == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: widget,
                )
        ],
      ),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //_scaffoldKey.currentState!.removeCurrentSnackBar();
    // _scaffoldKey.currentState!.showSnackBar(snackBar);
  }
}
