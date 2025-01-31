import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class MessageItem extends StatefulWidget {
  final String assetString;
  final String name;
  final String message;
  final String time;
  final bool isUnRead;
  const MessageItem(
      {super.key,
      required this.assetString,
      required this.name,
      required this.message,
      required this.time,
      required this.isUnRead});

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.5.w, right: 4.5.w),
      child: Row(
        children: [
          Image.asset(
            widget.assetString,
            width: 65.0,
            height: 65.0,
          ),
          SizedBox(
            width: 4.5.w,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    Text(
                      widget.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: Color(0XFFADAFBB)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.message,
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    Visibility(
                      visible: widget.isUnRead,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: primaryColor),
                        child: const Text(
                          "1",
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 12.0,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
