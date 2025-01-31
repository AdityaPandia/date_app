import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class InteractionWhoLikedItem extends StatefulWidget {
  final String imageString;
  final String name;
  const InteractionWhoLikedItem(
      {super.key, required this.imageString, required this.name});

  @override
  State<InteractionWhoLikedItem> createState() =>
      _InteractionWhoLikedItemState();
}

class _InteractionWhoLikedItemState extends State<InteractionWhoLikedItem> {
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
                borderRadius: BorderRadius.circular(12.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 40.0.w,
                    height: 28.0.h,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.black54.withOpacity(0.1)),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0.sp),
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
