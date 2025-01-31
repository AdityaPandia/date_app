import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/models/all_users_response.dart';
import 'package:seting_app/screens/swiper_card/swiper_detail_screen.dart';

import '../../utils/constants.dart';
import '../matched_screen.dart';
import 'example_candidate_model.dart';

class ExampleCard extends StatelessWidget {
///  final ExampleCandidateModel availableMatch;
  final AllUserData? allUserData;

  const ExampleCard({
    super.key,
    required this.allUserData,
  });

  @override
  Widget build(BuildContext context) {

    print("allUserData?.media?[0]: ${allUserData?.media?[0]}");
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(allUserData?.media?[0] ?? "")),
          // Positioned(
          //     top: 20.0,
          //     left: 3.5.w,
          //     child: GestureDetector(
          //       onTap: () {
          //         pushScreen(context,
          //             screen: const MatchedScreen(), withNavBar: false);
          //       },
          //       child: Container(
          //         padding: const EdgeInsets.all(8.0),
          //         decoration: BoxDecoration(
          //           color: Colors.black,
          //         //  color: whiteColor.withOpacity(0.2),
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //         child: const Row(
          //           children: [
          //             Icon(
          //               Icons.location_on,
          //               color: whiteColor,
          //             ),
          //             Text(
          //               "1 km",
          //               style: TextStyle(
          //                   color: whiteColor,
          //                   fontSize: 14.0,
          //                   fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //       ),
          //     )),
          Positioned(
              top: 20.0,
              right: 3.5.w,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                 // color: whiteColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFF1CFF28),
                      ),
                    ),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    const Text(
                      "Online",
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 0.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 100.0.w,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12.0),
                          bottomLeft: Radius.circular(12.0)),
                      color: Colors.black54.withOpacity(0.1)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.5.w, right: 10.5.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                allUserData?.name ?? "-",
                                style: const TextStyle(
                                    color: whiteColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pushScreen(context,
                                      screen: const SwiperDetailScreen());
                                },
                                child: Image.asset(
                                  "assets/images/eye_icon.png",
                                  width: 30.0,
                                  height: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.5.w, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Professional Model",
                            style: const TextStyle(
                              color: whiteColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
