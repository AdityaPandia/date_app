import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants.dart';


class SwiperDetailScreen extends StatefulWidget {
  const SwiperDetailScreen({super.key});

  @override
  State<SwiperDetailScreen> createState() => _SwiperDetailScreenState();
}

class _SwiperDetailScreenState extends State<SwiperDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Hero(
              tag: "profile",
              child: Image.asset(
                "assets/images/1.png",
                fit: BoxFit.cover,
                width: 100.0.w,
                height: 50.0.h,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0.h),
              padding: EdgeInsets.only(top: 8.0.h, left: 4.5.w, right: 4.5.w),
              decoration: const BoxDecoration(
                color: Color(0XFFf3f1fe),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12.0)),
                    width: 100.0.w,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About Me",
                            style: TextStyle(
                                color: primaryColor, fontSize: 17.0.sp),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Jessica Parker, 23",
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Proffesional model",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/about_education.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 4.5.w,
                            ),
                            const Text(
                              "Sv Public School",
                              style: TextStyle(
                                color: Color(0XFF394E62),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/about_job.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 4.5.w,
                            ),
                            const Text(
                              "Ui/UX Designer",
                              style: TextStyle(
                                color: Color(0XFF394E62),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/about_company.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 4.5.w,
                            ),
                            const Text(
                              "infosys solution center",
                              style: TextStyle(
                                color: Color(0XFF394E62),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/about_city.png",
                              width: 20.0,
                              height: 20.0,
                            ),
                            SizedBox(
                              width: 4.5.w,
                            ),
                            const Text(
                              "Jaipur",
                              style: TextStyle(
                                color: Color(0XFF394E62),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12.0)),
                    width: 100.0.w,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About",
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 17.0.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        const Text(
                            "My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading.."),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Basic and lifestyle",
                            style: TextStyle(
                                color: blackColor,
                                fontSize: 17.0.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0XFFf3f1fe),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: primaryColor)),
                            child: Padding(
                            padding: const EdgeInsets.all(7.0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/what_looking.svg",
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    const Text(
                                      "A Relationship",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: blackColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/excercise.svg",
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    const Text(
                                      "Occasional",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.3.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0XFFf3f1fe),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(color: primaryColor)),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/vacation.svg",
                                      width: 20.0,
                                      height: 20.0,
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    const Text(
                                      "Hiking & Backpack",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 SizedBox(
                    height: 1.5.h,
                  ),
                  Card(
                    color: whiteColor,
                    surfaceTintColor: whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Interests",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: const Text(
                                    "Pets",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.5.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                   padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: const Text(
                                    "Cooking",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.5.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                   padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: const Text(
                                    "Technology",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                   padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: const Text(
                                    "Art",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.5.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                 padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: const Text(
                                    "Science",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.5.w,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                   padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(color: transparentColor),
                                  ),
                                  child: const Text(
                                    "Science",
                                    style: TextStyle(
                                      color: transparentColor,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 35.0.h,
              width: 100.0.w,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25.0),
                        decoration: const BoxDecoration(
                            color: whiteColor, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          "assets/images/close_icon.svg",
                          width: 24.0,
                          height: 24.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          "assets/images/like.svg",
                          width: 45.0,
                          height: 45.0,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(25.0),
                        decoration: const BoxDecoration(
                            color: whiteColor, shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          "assets/images/flash_message.svg",
                          width: 24.0,
                          height: 24.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
