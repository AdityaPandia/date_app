import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class FeedItem extends StatefulWidget {
  const FeedItem({super.key});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 3.5.w, right: 3.5.w, top: 1.5.h, bottom: 1.5.h),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/sample1.png",
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(
                width: 4.5.w,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rahul Sharma",
                    style: TextStyle(
                        fontSize: 18.0.sp, fontWeight: FontWeight.bold),
                  ),
                  const Text("Sun, Jan 21  |  5:00 PM")
                ],
              )),
              const Icon(
                Icons.more_vert,
                size: 30.0,
                color: Color(0XFFD3D3D3),
              ),
            ],
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Image.asset("assets/images/sample2.png"),
          SizedBox(
            height: 1.0.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been",
              style: TextStyle(fontSize: 17.0.sp),
            ),
          ),
        ],
      ),
    );
  }
}
