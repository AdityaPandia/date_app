// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:seting_app/drawer/security_setting_screen.dart';
//
// import '../services/constants.dart';
//
// class SecurityPrivacyScreen extends StatefulWidget {
//   const SecurityPrivacyScreen({super.key});
//
//   @override
//   State<SecurityPrivacyScreen> createState() => _SecurityPrivacyScreenState();
// }
//
// class _SecurityPrivacyScreenState extends State<SecurityPrivacyScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0XFFf3f1fe),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         title: Text(
//           "Security & Privacy",
//           style: TextStyle(
//               fontSize: 20.0.sp,
//               fontWeight: FontWeight.bold,
//               color: primaryColor),
//         ),
//       ),
//       body: Column(
//         children: [
//            Expanded(
//             child: Column(
//               children: [
//                 const ListTile(
//                   leading: Icon(
//                     Icons.block_sharp,
//                     color: Colors.grey,
//                   ),
//                   title: Text("Blocking"),
//                 ),
//                 const Divider(),
//                 ListTile(
//                   onTap: () {
//                     pushScreen(context, screen: const SecuritySettingScreen());
//                   },
//                   leading: const Icon(
//                     Icons.security_rounded,
//                     color: Colors.grey,
//                   ),
//                   title: const Text(
//                     "Verification Status",
//                     style: TextStyle(
//                       color: blackColor,
//                     ),
//                   ),
//                   subtitle: const Text(
//                     "Not Verified",
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const Divider(),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 100.0.w,
//             child: Card(
//               color: const Color(0XFFffeaee),
//               margin: EdgeInsets.only(left: 5.5.w, right: 5.5.w),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Danger Zone",
//                         style: TextStyle(
//                             color: Color(0XFFf44337),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.0.h,
//                     ),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Delting your account will permanently delete all your data and you will not able to recover it",
//                         style: TextStyle(
//                             color: Color(0XFFf44337),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.5.h,
//                     ),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Hovwever you can reactivate your account by loggin again 30days of your account deletion request.",
//                         style: TextStyle(
//                             color: Color(0XFFf44337),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.5.h,
//                     ),
//                     MaterialButton(
//                       minWidth: 90.0.w,
//                       height: 45.0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0)),
//                       color: const Color(0XFFf44337),
//                       onPressed: () {},
//                       child: const Text(
//                         "Delete Account",
//                         style: TextStyle(
//                             color: whiteColor, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2.5.h,
//           )
//         ],
//       ),
//     );
//   }
// }
