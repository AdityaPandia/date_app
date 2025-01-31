import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class EditCardWidget extends StatefulWidget {
  final String assetString;
  final String? title;
  const EditCardWidget(
      {super.key, required this.assetString, required this.title});

  @override
  State<EditCardWidget> createState() => _EditCardWidgetState();
}

class _EditCardWidgetState extends State<EditCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      surfaceTintColor: whiteColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: 3.5.w, right: 3.5.w, top: 0.5.h, bottom: 0.5.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
                color: Color(0XFFf3f1fe), shape: BoxShape.circle),
            child: SvgPicture.asset(widget.assetString),
          ),
          SizedBox(
            width: 4.5.w,
          ),
          Expanded(
              child: Text(
            widget.title ?? "-",
            style: const TextStyle(fontSize: 16.0),
          )),
          MaterialButton(
            padding: const EdgeInsets.only(left: 10.0, right: 15.0),
            height: 30.0,
            onPressed: () {},
            minWidth: 15.0.w,
            color: primaryColor,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  size: 16.0,
                  color: whiteColor,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  "Edit",
                  style: TextStyle(color: whiteColor, fontSize: 14.0),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
