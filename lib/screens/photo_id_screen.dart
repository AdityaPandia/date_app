// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../services/constants.dart';
//
// class PhotoIDScreen extends StatefulWidget {
//   const PhotoIDScreen({super.key});
//
//   @override
//   State<PhotoIDScreen> createState() => _PhotoIDScreenState();
// }
//
// class _PhotoIDScreenState extends State<PhotoIDScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFf3f1fe),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         title: Text(
//           "Photo ID",
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
//               Icons.fact_check_outlined,
//               color: primaryColor,
//               size: 30.0.h,
//             ),
//             SizedBox(
//               height: 2.5.h,
//             ),
//             Text(
//               "Submit Photo ID",
//               style: TextStyle(
//                   fontSize: 20.0.sp,
//                   fontWeight: FontWeight.bold,
//                   color: primaryColor),
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//             Text(
//               "We need to verify your information.\nPlease Front and Back of Photo ID",
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
//                         Icons.assignment_ind_outlined,
//                         color: whiteColor,
//                       ),
//                       Spacer(),
//                       Text(
//                         "Front View",
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
//
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
//                         Icons.newspaper_outlined,
//                         color: whiteColor,
//                       ),
//                       Spacer(),
//                       Text(
//                         "Back View",
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
//                   onPressed: () {}),
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
//
