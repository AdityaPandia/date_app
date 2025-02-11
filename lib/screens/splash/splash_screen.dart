import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../utils/shared_pref/shared_pref_keys.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool(SharedPrefsKeys.isLoggedIn) ?? false;
    if (isLoggedIn) {
      print("User Logged In : ${isLoggedIn}");
      Navigator.pushReplacementNamed(context, Routes.dashBoard);
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.signIn, (Route<dynamic> route) => false);
        // Navigator.pushNamedAndRemoveUntil(
        //     context, Routes.signIn, (Route<dynamic> route) => false);
      }
          //   Navigator.pushNamed(
          //     context, Routes.tutorial,
          ///for reference- passing parameters
          // arguments: {
          //   "phoneNumber": getNumber(),
          //   "otp": response.otp
          // }
          //   );
          // }
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          AssetsStrings.logo,
          width: 70.0.w,
        ),
      ),
    );
  }
}
