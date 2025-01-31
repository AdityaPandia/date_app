import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class MatchFlashItem extends StatefulWidget {
  final String imageString;
  final String name;
  const MatchFlashItem(
      {super.key, required this.imageString, required this.name});

  @override
  State<MatchFlashItem> createState() => _MatchFlashItemState();
}

class _MatchFlashItemState extends State<MatchFlashItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          widget.imageString,
          width: 40.0.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 40.0.w,
                    height: 50.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 2.5.w, right: 2.5.w),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.black54.withOpacity(0.1)),
                    child: Text(
                      "Message : Hello, How Are You",
                      style: TextStyle(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
