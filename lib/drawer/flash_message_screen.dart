// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../services/constants.dart';
//
// class FlashMessageScreen extends StatefulWidget {
//   const FlashMessageScreen({super.key});
//
//   @override
//   State<FlashMessageScreen> createState() => _FlashMessageScreenState();
// }
//
// class _FlashMessageScreenState extends State<FlashMessageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFf3f1fe),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         title: Text(
//           "Flash Messages",
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
//                 "assets/flash_message_icon.svg",
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
//             "Remaining until swipes and reloads refills",
//             style: TextStyle(fontSize: 15.0.sp, color: blackColor),
//           ),
//           Text(
//             "Get more flash messages",
//             style: TextStyle(
//                 fontSize: 20.0.sp,
//                 fontWeight: FontWeight.bold,
//                 color: primaryColor),
//           ),
//           Text(
//             "And connent with anyone you want!",
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
//                     height: 200.0,
//                     width: 40.0.w,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         color: whiteColor,
//                         borderRadius: BorderRadius.circular(12.0)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(20.0),
//                           decoration: const BoxDecoration(
//                               color: Color(0XFFf3f1fe), shape: BoxShape.circle),
//                           child: Text(
//                             "1",
//                             style: TextStyle(
//                                 fontSize: 30.0.sp,
//                                 height: 0.8,
//                                 fontWeight: FontWeight.bold,
//                                 color: primaryColor),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "Flashes",
//                           style: TextStyle(
//                               fontSize: 16.0.sp,
//                               color: blackColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "₹ 500/mo",
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
//                     height: 200.0,
//                     width: 40.0.w,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         color: whiteColor,
//                         borderRadius: BorderRadius.circular(12.0)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(20.0),
//                           decoration: const BoxDecoration(
//                               color: Color(0XFFf3f1fe), shape: BoxShape.circle),
//                           child: Text(
//                             "10",
//                             style: TextStyle(
//                                 fontSize: 30.0.sp,
//                                 height: 0.8,
//                                 fontWeight: FontWeight.bold,
//                                 color: primaryColor),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "Flashes",
//                           style: TextStyle(
//                               fontSize: 16.0.sp,
//                               color: blackColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "₹ 2500/mo",
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
//                     height: 200.0,
//                     width: 40.0.w,
//                     padding: const EdgeInsets.all(20.0),
//                     decoration: BoxDecoration(
//                         color: whiteColor,
//                         borderRadius: BorderRadius.circular(12.0)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(20.0),
//                           decoration: const BoxDecoration(
//                               color: Color(0XFFf3f1fe), shape: BoxShape.circle),
//                           child: Text(
//                             "3",
//                             style: TextStyle(
//                                 fontSize: 30.0.sp,
//                                 height: 0.8,
//                                 fontWeight: FontWeight.bold,
//                                 color: primaryColor),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "Flashes",
//                           style: TextStyle(
//                               fontSize: 16.0.sp,
//                               color: blackColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 8.0,
//                         ),
//                         Text(
//                           "₹ 1000/mo",
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
//             "your flash messages help you contact them directly without matching",
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
//                 "get 10 flashes for  ₹2500",
//                 style: TextStyle(
//                     color: whiteColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.0),
//               ),
//               onPressed: () {}),
//           SizedBox(
//             height: 1.5.h,
//           ),
//         ],
//       ),
//     );
//   }
// }
