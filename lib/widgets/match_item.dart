import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class MatchItem extends StatefulWidget {
  final String imageString;
  final String name;
  const MatchItem({super.key, required this.imageString, required this.name});

  @override
  State<MatchItem> createState() => _MatchItemState();
}

class _MatchItemState extends State<MatchItem> {
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
            Padding(
              padding: EdgeInsets.only(left: 3.5.w, bottom: 8.0),
              child:  Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      color: whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)),
                        color: Colors.black54.withOpacity(0.1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            "assets/close.svg",
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                        Container(
                          color: whiteColor,
                          height: 50.0,
                          width: 0.8,
                        ),
                        Expanded(
                          child: SvgPicture.asset(
                            "assets/like.svg",
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                      ],
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
