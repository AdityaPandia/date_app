// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../services/constants.dart';
//
// class TakeSelfieScreen extends StatefulWidget {
//   const TakeSelfieScreen({super.key});
//
//   @override
//   State<TakeSelfieScreen> createState() => _TakeSelfieScreenState();
// }
//
// class _TakeSelfieScreenState extends State<TakeSelfieScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFf3f1fe),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         title: Text(
//           "Selfie",
//           style: TextStyle(
//               fontSize: 20.0.sp,
//               fontWeight: FontWeight.bold,
//               color: primaryColor),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 5.5.h,
//             ),
//             Container(
//               width: 80.0.w,
//               height: 50.0.h,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       color: blackColor.withOpacity(0.5), width: 0.4),
//                   borderRadius: BorderRadius.circular(12.0)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.camera_alt_outlined,
//                     color: primaryColor,
//                     size: 20.0.h,
//                   ),
//                   Text(
//                     "Take a Selfie",
//                     style: TextStyle(
//                         color: primaryColor,
//                         fontSize: 16.0.sp,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 1.5.h,
//             ),
//             const Text(
//               "Upload Your Selfie Image to\nVerify your Identity",
//               textAlign: TextAlign.center,
//               style: TextStyle(color: blackColor, fontSize: 16.0,
//               fontWeight: FontWeight.w500),
//             ),
//             const Spacer(),
//             MaterialButton(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0)),
//                 minWidth: 90.0.w,
//                 height: 55.0,
//                 color: primaryColor,
//                 child: const Text(
//                   "Upload",
//                   style: TextStyle(
//                       color: whiteColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0),
//                 ),
//                 onPressed: () {}),
//             SizedBox(
//               height: 2.5.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
