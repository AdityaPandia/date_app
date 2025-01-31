import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants.dart';
import '../../widgets/match_item.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f1fe),
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          "Matches",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(
            left: 3.5.w, right: 3.5.w, bottom: 7.5.h, top: 2.5.h),
        child: Container(
          padding: EdgeInsets.only(
              left: 3.5.w, right: 3.5.w, top: 1.5.h, bottom: 1.5.h),
          decoration: BoxDecoration(
              color: whiteColor, borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MatchItem(
                      imageString: "assets/images/sample4.png", name: "Leilani, 19"),
                  SizedBox(
                    width: 3.5.w,
                  ),
                  const MatchItem(
                      imageString: "assets/images/sample5.png", name: "Annabelle, 20"),
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MatchItem(
                      imageString: "assets/images/sample6.png", name: "Leilani, 19"),
                  SizedBox(
                    width: 3.5.w,
                  ),
                  const MatchItem(
                      imageString: "assets/images/sample7.png", name: "Annabelle, 20"),
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    endIndent: 15.0,
                  )),
                  Text("Yesterday"),
                  Expanded(
                      child: Divider(
                    indent: 15.0,
                  )),
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const MatchItem(
                      imageString: "assets/images/sample8.png", name: "Leilani, 19"),
                  SizedBox(
                    width: 3.5.w,
                  ),
                  const MatchItem(
                      imageString: "assets/images/sample9.png", name: "Annabelle, 20"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
