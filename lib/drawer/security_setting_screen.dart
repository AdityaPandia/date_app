// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../services/constants.dart';
// import '../screens/photo_id_screen.dart';
// import '../screens/take_selfie_screen.dart';
//
// class SecuritySettingScreen extends StatefulWidget {
//   const SecuritySettingScreen({super.key});
//
//   @override
//   State<SecuritySettingScreen> createState() => _SecuritySettingScreenState();
// }
//
// class _SecuritySettingScreenState extends State<SecuritySettingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFf3f1fe),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         title: Text(
//           "Verification",
//           style: TextStyle(
//               fontSize: 20.0.sp,
//               fontWeight: FontWeight.bold,
//               color: primaryColor),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             SizedBox(
//               height: 10.0.h,
//             ),
//             Icon(
//               Icons.security_rounded,
//               color: primaryColor,
//               size: 30.0.h,
//             ),
//             SizedBox(
//               height: 2.5.h,
//             ),
//             Text(
//               "Submit Documents",
//               style: TextStyle(
//                   fontSize: 20.0.sp,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             Text(
//               "We need to verify your information.\nPlease submit the documents below.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 15.0.sp, color: blackColor),
//             ),
//             const Spacer(),
//             Padding(
//               padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
//               child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   minWidth: 90.0.w,
//                   height: 65.0,
//                   color: primaryColor,
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.upload_file_outlined,
//                         color: whiteColor,
//                       ),
//                       Spacer(),
//                       Text(
//                         "Photo ID",
//                         style: TextStyle(
//                             color: whiteColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18.0),
//                       ),
//                       Spacer(),
//                       Icon(
//                         Icons.arrow_forward,
//                         color: whiteColor,
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     pushScreen(context,
//                         screen: const PhotoIDScreen(), withNavBar: false);
//                   }),
//             ),
//             SizedBox(
//               height: 2.5.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
//               child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   minWidth: 90.0.w,
//                   height: 65.0,
//                   color: primaryColor,
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.camera_front,
//                         color: whiteColor,
//                       ),
//                       Spacer(),
//                       Text(
//                         "Take a Selfie",
//                         style: TextStyle(
//                             color: whiteColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18.0),
//                       ),
//                       Spacer(),
//                       Icon(
//                         Icons.arrow_forward,
//                         color: whiteColor,
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     pushScreen(context,
//                         screen: const TakeSelfieScreen(), withNavBar: false);
//                   }),
//             ),
//             SizedBox(
//               height: 2.5.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
