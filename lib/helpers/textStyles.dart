import 'dart:ui';

import 'package:flutter/material.dart';

class TextStylesClass{

  ///SourceSansPro semiBold
  static arizoniaRegular({var color, var size}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 16.0,
      fontFamily: "Arizonia",
      fontWeight: FontWeight.w600,
    );
  }
}