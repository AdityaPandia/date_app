import 'package:flutter/cupertino.dart';
import 'package:seting_app/screens/auth/register/additional_info/additional_info_screen.dart';
import 'package:seting_app/screens/auth/register/basic_info/basic_info_screen.dart';
import 'package:seting_app/screens/dashboard_screen.dart';
import 'package:seting_app/screens/signin_screen.dart';
import 'package:seting_app/screens/splash/splash_screen.dart';


class Routes {
  static const String splash = "/splash";
  static const String signIn = "/signIn";
  static const String basicInfo = "/basicInfo";
  static const String dashBoard = "/dashBoard";

  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
      case signIn:
        return CupertinoPageRoute(builder: (_) => SignInScreen());
      case basicInfo:
        return CupertinoPageRoute(builder: (_) => BasicInfoScreen());
      case dashBoard:
        return CupertinoPageRoute(builder: (_) => DashboardScreen());


      // case productDetail:
      //   return CupertinoPageRoute(
      //       builder: (_) => ProductDetailScreen(
      //         product: setting.arguments as Product,
      //       ));

      default:
        return CupertinoPageRoute(builder: (_) => SplashScreen());
    }
  }
}
