// // ignore_for_file: use_build_context_synchronously
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../services/constants.dart';
// import '../../../services/web_api.dart';
// import '../../dashboard_screen.dart';
// import '../register/basic_info/basic_info_screen.dart';
//
// const List<String> scopes = <String>[
//   'email',
// ];
//
// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: scopes,
// );
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   GoogleSignInAccount? _currentUser;
//   late String emailAddress = '';
//
//   late String id;
//   late String email;
//   late String name;
//   late String role;
//   late String accessToken;
//   late String refreshToken;
//
//   @override
//   void initState() {
//     _handleSignOut();
//     super.initState();
//     _googleSignIn.onCurrentUserChanged
//         .listen((GoogleSignInAccount? account) async {
//       _currentUser = account;
//       if (_currentUser != null) {
//         setState(() {
//           emailAddress = account!.email;
//         });
//       }
//       _currentUser!.authentication.then((result) {
//         EasyLoading.show();
//         signInWithSocial();
//       }).catchError((err) {
//         print(err);
//       });
//     });
//
//     _googleSignIn.signInSilently();
//   }
//
//   Future<void> _handleSignIn() async {
//     try {
//       await _googleSignIn.signIn();
//       // ignore: empty_catches
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   Future<void> _handleSignOut() async {
//     try {
//       await _googleSignIn.signOut();
//       // ignore: empty_catches
//     } catch (error) {}
//   }
//
//   signInWithSocial() async {
//     // var getData = await WebConfig.signInWithEmail(emailString: emailAddress);
//     var getData =
//         await WebConfig.signInWithEmail(emailString: "user1@gmail.com");
//     print(getData);
//     if (getData["success"] == true) {
//       setState(() {
//         id = getData["data"]["id"];
//         email = getData["data"]["email"];
//         name = getData["data"]["name"];
//         role = getData["data"]["role"];
//         accessToken = getData["data"]["accessToken"];
//         refreshToken = getData["data"]["refreshToken"];
//         setShared();
//       });
//     } else {
//       await EasyLoading.showError(getData["error"]);
//     }
//   }
//
//   setShared() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.setString("id", id);
//     await sharedPreferences.setString("email", email);
//     await sharedPreferences.setString("name", name);
//     await sharedPreferences.setString("role", role);
//     await sharedPreferences.setString("accessToken", accessToken);
//     await sharedPreferences.setString("refreshToken", refreshToken);
//     await EasyLoading.showSuccess("Logged in Successfully");
//     nextScreenReplace(context, const DashboardScreen());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 10.0.h,
//             ),
//             Image.asset(
//               "assets/logo.png",
//               width: 70.0.w,
//             ),
//             Text(
//               "Seting",
//               style: TextStyle(
//                   color: whiteColor,
//                   fontSize: 24.0.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//             const Spacer(),
//             Padding(
//               padding: EdgeInsets.only(left: 5.5.w, right: 5.5.w),
//               child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   minWidth: 90.0.w,
//                   height: 55.0,
//                   color: whiteColor,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/google.png",
//                         width: 24.0,
//                         height: 24.0,
//                       ),
//                       SizedBox(
//                         width: 4.5.w,
//                       ),
//                       const Text(
//                         "Sign In With Google",
//                         style: TextStyle(
//                             color: primaryColor,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.0),
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     HapticFeedback.lightImpact();
//                     _handleSignOut();
//                     _handleSignIn();
//                   }),
//             ),
//             SizedBox(
//               height: 3.5.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 5.5.w, right: 5.5.w),
//               child: MaterialButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   minWidth: 90.0.w,
//                   height: 55.0,
//                   color: whiteColor,
//                   child: const Text(
//                     "Create New Account",
//                     style: TextStyle(
//                         color: primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16.0),
//                   ),
//                   onPressed: () {
//                     nextScreen(context, const BasicInfoScreen());
//                   }),
//             ),
//             SizedBox(
//               height: 3.5.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
