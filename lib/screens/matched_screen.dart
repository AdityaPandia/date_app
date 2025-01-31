import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class MatchedScreen extends StatefulWidget {
  const MatchedScreen({super.key});

  @override
  State<MatchedScreen> createState() => _MatchedScreenState();
}

class _MatchedScreenState extends State<MatchedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 3.5.h,
          ),
          Image.asset("assets/match_photo.png"),
          Text(
            "It’s a match, Jake!",
            style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor),
          ),
          Text(
            "Start a conversation now with each other",
            style: TextStyle(fontSize: 15.0.sp, color: blackColor),
          ),
          SizedBox(
            height: 5.5.h,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minWidth: 85.0.w,
              height: 55.0,
              color: primaryColor,
              child: const Text(
                "Say Hello",
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              onPressed: () {}),
          SizedBox(
            height: 2.0.h,
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minWidth: 85.0.w,
              height: 55.0,
              color: const Color(0XFFf3f1fe),
              child: const Text(
                "Keep swiping",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              onPressed: () {}),
          SizedBox(
            height: 1.0.h,
          ),
        ],
      ),
    );
  }
}
