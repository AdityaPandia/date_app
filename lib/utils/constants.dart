import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_strings.dart';

class AppColors{
 static const  Color white = Colors.white;
 static const Color black = Colors.black;
 static const  Color transparent = Colors.transparent;
 static const Color primary = Color(0XFF5E54DD);
 static const Color lightPrimary = Color(0xfff7f6ff);
 static const Color errorColor = Color(0xffb42b23);
}

const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color transparentColor = Colors.transparent;
const Color primaryColor = Color(0XFF5E54DD);

const double kTextScaleFactor = 0.8;

final textInputDecoration = InputDecoration(
  hintStyle: const TextStyle(color: Color(0XFF718190), fontSize: 15.0),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
);
final textInputDecoration3 = InputDecoration(
  hintStyle: const TextStyle(color: Color(0XFF718190), fontSize: 15.0),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Color(0XFFcbc7f5), width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Color(0XFFcbc7f5), width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Color(0XFFcbc7f5), width: 1.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Color(0XFFcbc7f5), width: 1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Color(0XFFcbc7f5), width: 1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: Color(0XFFcbc7f5), width: 1.0),
  ),
);
final textInputDecoration2 = InputDecoration(
  hintStyle: const TextStyle(color: Color(0XFF718190), fontSize: 15.0),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: transparentColor, width: 1.0),
  ),
);

void showSnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
Future<bool> signOutFromGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}

getSharedData() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? id = sharedPreferences.getString('id');
  String? emailAddress = sharedPreferences.getString('email');
  String? name = sharedPreferences.getString('name');
  String? role = sharedPreferences.getString('role');
  String? accessToken = sharedPreferences.getString('accessToken');
  String? refreshToken = sharedPreferences.getString('refreshToken');

  var data = {
    "id": id,
    "emailAddress": emailAddress,
    "name": name,
    "role": role,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
  return data;
}

sendCrashData(String apiLink) async {
  var getData = await getSharedData();
  FirebaseCrashlytics.instance
      .setCustomKey('Email Address', "${getData['emailAddress']}");
  FirebaseCrashlytics.instance
      .setCustomKey('Phone Number', "${getData['phoneNo']}");
  FirebaseCrashlytics.instance
      .setCustomKey('First Name', "${getData['firstName']}");
  FirebaseCrashlytics.instance
      .setCustomKey('Last Name', "${getData['lastName']}");
  FirebaseCrashlytics.instance
      .setCustomKey('User ID', "${getData['customerID']}");
  FirebaseCrashlytics.instance.setUserIdentifier("${getData['customerID']}");
}

//
// var logger = Logger(
//   printer: PrettyPrinter(),
// );

// Widget skipButton({onPressed}){
//   return MaterialButton(
//     onPressed: onPressed,
//     child: const Text(
//       "Skip",
//       style: TextStyle(
//         color: primaryColor,
//         fontWeight: FontWeight.bold,
//         fontSize: 16.0,
//       ),
//     ),
//   );
// }

Widget backButton({onPressed}){
  return MaterialButton(
    onPressed: onPressed,
    child: Icon(Icons.arrow_back,color: AppColors.primary,),

  );
}

Widget buildHeader({onBack}) {
  return Container(
    color: AppColors.white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 7.5.h),
          // backButton(onPressed: onBack),
          Row(
            children: [
               backButton(onPressed: onBack),
              Text(
                AppStrings.welcomeMessage,
                style: TextStyle(
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Text(
            AppStrings.fillDetail,
            style: TextStyle(fontSize: 16.0.sp),
          ),
          SizedBox(height: 3.5.h),
        ],
      ),
    ),
  );
}