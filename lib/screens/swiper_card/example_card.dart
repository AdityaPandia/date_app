
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/models/all_users_response.dart';
import 'package:seting_app/screens/swiper_card/swiper_detail_screen.dart';
import '../../utils/constants.dart';
import '../matched_screen.dart';

class ExampleCard extends StatefulWidget {
  final AllUserData? allUserData;
  final bool isActive; // ✅ NEW: Determines if the card is active

  const ExampleCard({
    super.key,
    required this.allUserData,
    required this.isActive, // ✅ NEW PARAMETER
  });

  @override
  _ExampleCardState createState() => _ExampleCardState();
}
class _ExampleCardState extends State<ExampleCard> {
  int _currentImageIndex = 0; // Track the active image

  int _calculateAge(String? birthdate) {
    if (birthdate == null || birthdate.isEmpty) return 0;
    try {
      DateTime birthDate = DateTime.parse(birthdate);
      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;

      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    int age = _calculateAge(widget.allUserData?.birthday);
    List<String> mediaList = widget.allUserData?.media ?? [];

    return ClipRRect(
      borderRadius: BorderRadius.circular(3.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          /// **Show Carousel Only If Active**
          CarouselSlider(
            items: mediaList.map((imageUrl) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(3.w),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 100.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 65.h,
              initialPage: 0,
              autoPlay: widget.isActive, // ✅ Only auto-play if card is active
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                if (widget.isActive && mounted) { // ✅ Change image index only if active
                  setState(() {
                    _currentImageIndex = index;
                  });
                }
              },
            ),
          ),

                    if (widget.isActive && mediaList.isNotEmpty)   Positioned(
            top: 2.h,
            right: 4.w,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 2.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Row(
                children: [
                  Container(
                    width: 1.5.w,
                    height: 1.5.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFF1CFF28),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    "Online",
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 12.sp, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// **Vertical Dot Indicators (Only Show If Active)**
          if (widget.isActive && mediaList.length > 1)
            Positioned(
              top: 20.h,
              right: 0.w,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    mediaList.length,
                        (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(vertical: 0.8.h),
                      width: 4.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: _currentImageIndex == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          /// **Blurred Footer with Name & Details (Only Show If Active)**
          if (widget.isActive && mediaList.isNotEmpty)
            Positioned(
              bottom: 0.0,
              child: ClipRRect(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(3.w)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 90.w,
                    padding:
                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(3.w)),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// **Name and Eye Icon**
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${widget.allUserData?.name}, " ?? "-",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  age > 0 ? "$age" : "Age unavailable",
                                  style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                pushScreen(context,
                                    screen: const SwiperDetailScreen());
                              },
                              child: Image.asset(
                                "assets/images/eye_icon.png",
                                width: 6.w,
                                height: 6.w,
                              ),
                            ),
                          ],
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

// class _ExampleCardState extends State<ExampleCard> {
//   int _currentImageIndex = 0; // Track the active image
//
//   int _calculateAge(String? birthdate) {
//     if (birthdate == null || birthdate.isEmpty) return 0;
//     try {
//       DateTime birthDate = DateTime.parse(birthdate);
//       DateTime today = DateTime.now();
//       int age = today.year - birthDate.year;
//
//       if (today.month < birthDate.month ||
//           (today.month == birthDate.month && today.day < birthDate.day)) {
//         age--;
//       }
//       return age;
//     } catch (e) {
//       return 0;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     int age = _calculateAge(widget.allUserData?.birthday);
//     List<String> mediaList = widget.allUserData?.media ?? [];
//
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(3.w),
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           /// **Show Carousel Only If Active**
//
//             CarouselSlider(
//               items: mediaList.map((imageUrl) {
//                 return ClipRRect(
//                   borderRadius: BorderRadius.circular(3.w),
//                   child: CachedNetworkImage(
//                     imageUrl: imageUrl,
//                     width: 100.w,
//                     height: 70.h,
//                     fit: BoxFit.cover,
//                     errorWidget: (context, url, error) => Icon(Icons.error),
//                   ),
//                 );
//               }).toList(),
//               options: CarouselOptions(
//                 height: 65.h,
//                 initialPage: 0,
//                 autoPlay: true,
//                 enableInfiniteScroll: false,
//                 viewportFraction: 1.0,
//                 onPageChanged: (index, reason) {
//                   if (mounted) {
//                     setState(() {
//                       _currentImageIndex = index;
//                     });
//                   }
//                 },
//               ),
//             ),
//
//           if (widget.isActive && mediaList.isNotEmpty)   Positioned(
//             top: 2.h,
//             right: 4.w,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 2.w),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(2.w),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 1.5.w,
//                     height: 1.5.w,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0XFF1CFF28),
//                     ),
//                   ),
//                   SizedBox(width: 1.w),
//                   Text(
//                     "Online",
//                     style: TextStyle(
//                       color: whiteColor,
//                       fontSize: 12.sp, // Responsive font size
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           /// **Vertical Dot Indicators (Only Show If Active)**
//           if (widget.isActive && mediaList.length > 1)
//             Positioned(
//               top: 20.h,
//               right: 0.w,
//               child: Container(
//                 padding: EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.4),
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(12),
//                     bottomLeft: Radius.circular(12),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     mediaList.length,
//                         (index) => AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       margin: EdgeInsets.symmetric(vertical: 0.8.h),
//                       width: 4.0,
//                       height: 4.0,
//                       decoration: BoxDecoration(
//                         color: _currentImageIndex == index
//                             ? Colors.white
//                             : Colors.white.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//           /// **Blurred Footer with Name & Details (Only Show If Active)**
//           if (widget.isActive && mediaList.isNotEmpty)
//             Positioned(
//               bottom: 0.0,
//               child: ClipRRect(
//                 borderRadius:
//                 BorderRadius.vertical(bottom: Radius.circular(3.w)),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                   child: Container(
//                     width: 90.w,
//                     padding:
//                     EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
//                     decoration: BoxDecoration(
//                       borderRadius:
//                       BorderRadius.vertical(bottom: Radius.circular(3.w)),
//                       color: Colors.black.withOpacity(0.4),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// **Name and Eye Icon**
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   "${widget.allUserData?.name}, " ?? "-",
//                                   style: TextStyle(
//                                     color: whiteColor,
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   age > 0 ? "$age" : "Age unavailable",
//                                   style: TextStyle(
//                                     color: whiteColor,
//                                     fontSize: 18.sp,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 pushScreen(context,
//                                     screen: const SwiperDetailScreen());
//                               },
//                               child: Image.asset(
//                                 "assets/images/eye_icon.png",
//                                 width: 6.w,
//                                 height: 6.w,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }



