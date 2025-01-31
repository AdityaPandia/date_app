import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/constants.dart';

import '../utils/asset_strings.dart';

class AppThemedButton extends StatefulWidget {
  Function() onPressed;
  String? icon;
  String label;
  bool withIcon = false;
 var backgroundColor;
 var labelColor;
  AppThemedButton(
      {super.key,
      required this.onPressed,
       this.icon,
        this.backgroundColor,
        this.labelColor,
        required this.withIcon,
      required this.label});

  @override
  State<AppThemedButton> createState() =>
      _AppThemedButtonState();
}

class _AppThemedButtonState extends State<AppThemedButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        minWidth: 90.0.w,
        height: 55.0,
        color:widget.backgroundColor ?? AppColors.white,
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: widget.withIcon == true,
              child: Image.asset(
               widget.icon ?? "",
                width: 24.0,
                height: 24.0,
              ),
            ),
            Visibility(
              visible: widget.withIcon == true,
              child: SizedBox(
                width: 4.5.w,
              ),
            ),
             Text(
              widget.label,
              style: TextStyle(
                  color: widget.labelColor ?? AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        ));
  }
}
