// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants.dart';
import '../../widgets/interaction_liked_item.dart';
import '../../widgets/interaction_who_liked_item.dart';
import '../../widgets/match_flash_item.dart';

class InteractionScreen extends StatefulWidget {
  const InteractionScreen({super.key});

  @override
  State<InteractionScreen> createState() => _InteractionScreenState();
}

class _InteractionScreenState extends State<InteractionScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f1fe),
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            "assets/images/search.svg",
            width: 18.0,
            height: 18.0,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Interactions",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w, top: 2.5.h),
        padding: EdgeInsets.only(
            left: 3.5.w, right: 3.5.w, top: 1.5.h, bottom: 1.5.h),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          children: [
            DefaultTabController(
              initialIndex: index,
              length: 3,
              child: TabBar(
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.only(right: 23.0),
                tabAlignment: TabAlignment.start,
                labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: blackColor),
                unselectedLabelColor: Colors.grey,
                labelColor: blackColor,
                isScrollable: true,
                onTap: (val) {
                  setState(() {
                    index = val;
                  });
                },
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/like.svg",
                          width: 20.0,
                          height: 20.0,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        const Text(
                          "Liked",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/flash.svg",
                          color: primaryColor,
                          width: 20.0,
                          height: 20.0,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        const Text(
                          "Flash Message",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/like.svg",
                          width: 20.0,
                          height: 20.0,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        const Text(
                          "Who Likes You",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Expanded(
              child: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 1.5.h, bottom: 7.5.h),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InreactionLikedItem(
                              imageString: "assets/images/sample4.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const InreactionLikedItem(
                              imageString: "assets/images/sample5.png",
                              name: "Annabelle, 20"),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InreactionLikedItem(
                              imageString: "assets/images/sample6.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const InreactionLikedItem(
                              imageString: "assets/images/sample7.png",
                              name: "Annabelle, 20"),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InreactionLikedItem(
                              imageString: "assets/images/sample8.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const InreactionLikedItem(
                              imageString: "assets/images/sample9.png",
                              name: "Annabelle, 20"),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 1.5.h, bottom: 7.5.h),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MatchFlashItem(
                              imageString: "assets/images/sample4.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const MatchFlashItem(
                              imageString: "assets/images/sample5.png",
                              name: "Annabelle, 20"),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MatchFlashItem(
                              imageString: "assets/images/sample6.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const MatchFlashItem(
                              imageString: "assets/images/sample7.png",
                              name: "Annabelle, 20"),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MatchFlashItem(
                              imageString: "assets/images/sample8.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const MatchFlashItem(
                              imageString: "assets/images/sample9.png",
                              name: "Annabelle, 20"),
                        ],
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 1.5.h, bottom: 7.5.h),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InteractionWhoLikedItem(
                              imageString: "assets/images/sample4.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const InteractionWhoLikedItem(
                              imageString: "assets/images/sample5.png",
                              name: "Annabelle, 20"),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InteractionWhoLikedItem(
                              imageString: "assets/images/sample6.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const InteractionWhoLikedItem(
                              imageString: "assets/images/sample7.png",
                              name: "Annabelle, 20"),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const InteractionWhoLikedItem(
                              imageString: "assets/images/sample8.png",
                              name: "Leilani, 19"),
                          SizedBox(
                            width: 3.5.w,
                          ),
                          const InteractionWhoLikedItem(
                              imageString: "assets/images/sample9.png",
                              name: "Annabelle, 20"),
                        ],
                      )
                    ],
                  ),
                ),
              ][index],
            ),
          ],
        ),
      ),
    );
  }
}
