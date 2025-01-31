// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../services/constants.dart';
// import 'flash_message_screen.dart';
//
// class SettingPlusScreen extends StatefulWidget {
//   const SettingPlusScreen({super.key});
//
//   @override
//   State<SettingPlusScreen> createState() => _SettingPlusScreenState();
// }
//
// class _SettingPlusScreenState extends State<SettingPlusScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFf3f1fe),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         title: Text(
//           "Seting Plus",
//           style: TextStyle(
//               fontSize: 20.0.sp,
//               fontWeight: FontWeight.bold,
//               color: primaryColor),
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 2.5.h,
//           ),
//           Center(
//             child: Container(
//               padding: const EdgeInsets.all(20.0),
//               decoration: const BoxDecoration(
//                 color: whiteColor,
//                 shape: BoxShape.circle,
//               ),
//               child: SvgPicture.asset(
//                 "assets/premium.svg",
//                 width: 60.0,
//                 height: 60.0,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2.5.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: const BoxDecoration(
//                   color: whiteColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   "07",
//                   style: TextStyle(
//                     fontSize: 20.0.sp,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 1.5.w,
//               ),
//               const Icon(
//                 Icons.more_vert,
//                 color: Colors.grey,
//               ),
//               SizedBox(
//                 width: 1.5.w,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: const BoxDecoration(
//                   color: primaryColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   "38",
//                   style: TextStyle(fontSize: 20.0.sp, color: whiteColor),
//                 ),
//               ),
//               SizedBox(
//                 width: 1.5.w,
//               ),
//               const Icon(
//                 Icons.more_vert,
//                 color: Colors.grey,
//               ),
//               SizedBox(
//                 width: 1.5.w,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: const BoxDecoration(
//                   color: whiteColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   "45",
//                   style: TextStyle(
//                     fontSize: 20.0.sp,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 2.5.h,
//           ),
//           Text(
//             "Upgrade to premium",
//             style: TextStyle(
//                 fontSize: 20.0.sp,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor),
//           ),
//           const SizedBox(
//             height: 8.0,
//           ),
//           Text(
//             "unlimited swipes, likes, matches and so more!",
//             style: TextStyle(fontSize: 15.0.sp, color: blackColor),
//           ),
//           SizedBox(
//             height: 5.5.h,
//           ),
//           SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Container(
//                     height: 180.0,
//                     width: 40.0.w,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         color: whiteColor,
//                         borderRadius: BorderRadius.circular(12.0)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/super_likes.png",
//                           width: 80.0,
//                           height: 80.0,
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "Super Likes",
//                           style:
//                               TextStyle(fontSize: 16.0.sp, color: blackColor),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 7.5.w,
//                   ),
//                   Container(
//                     height: 180.0,
//                     width: 40.0.w,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         color: whiteColor,
//                         borderRadius: BorderRadius.circular(12.0)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/my_boosts.png",
//                           width: 80.0,
//                           height: 80.0,
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "My Boosts",
//                           style:
//                               TextStyle(fontSize: 16.0.sp, color: blackColor),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "GET MORE",
//                           style: TextStyle(
//                               fontSize: 16.0.sp, color: Color(0XFF9709E0)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 7.5.w,
//                   ),
//                   Container(
//                     height: 180.0,
//                     width: 40.0.w,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         color: whiteColor,
//                         borderRadius: BorderRadius.circular(12.0)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           "assets/subscriptions.png",
//                           width: 80.0,
//                           height: 80.0,
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "Subscription",
//                           style:
//                               TextStyle(fontSize: 16.0.sp, color: blackColor),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//           const Spacer(),
//           SizedBox(
//             height: 2.5.h,
//           ),
//           Text(
//             "Does my subscription auto renew?",
//             style: TextStyle(
//                 fontSize: 18.0.sp,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor),
//           ),
//           const SizedBox(
//             height: 8.0,
//           ),
//           Text(
//             "indeed the package you purchase will be renewed automatically when the show time end!",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 15.0.sp, color: blackColor),
//           ),
//           SizedBox(
//             height: 3.5.h,
//           ),
//           MaterialButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10.0)),
//               minWidth: 90.0.w,
//               height: 55.0,
//               color: primaryColor,
//               child: const Text(
//                 "Get Seting Plus",
//                 style: TextStyle(
//                     color: whiteColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.0),
//               ),
//               onPressed: () {
//                 pushScreen(context,
//                     screen: const FlashMessageScreen(), withNavBar: false);
//               }),
//           SizedBox(
//             height: 1.5.h,
//           ),
//         ],
//       ),
//     );
//   }
// }
