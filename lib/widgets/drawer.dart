import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../drawer/account_setting_screen.dart';
import '../drawer/edit_profile_screen.dart';
import '../drawer/privacy_policy_screen.dart';
import '../drawer/profile_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../utils/constants.dart';

class DrawerSideBar extends StatefulWidget {
  const DrawerSideBar({super.key});

  @override
  State<DrawerSideBar> createState() => _DrawerSideBarState();
}

class _DrawerSideBarState extends State<DrawerSideBar> {
  String? email;
  String? name;
  String? displayPhoto;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNameAndEmail();
  }

  getNameAndEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString(SharedPrefsKeys.userEmail);
      name = prefs.getString(SharedPrefsKeys.userName);
      displayPhoto = prefs.getString(SharedPrefsKeys.userDisplayPhoto);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 90.0.w,
      backgroundColor: primaryColor,
      elevation: 20.0,
      child: Column(
        children: [
          SizedBox(
            height: 5.5.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 4.0.w,
              ),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  pushScreen(context,
                      screen: const ProfileScreen(), withNavBar: false);
                },
                child:  ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: displayPhoto ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child:Image.asset("assets/images/a1.png"), // Placeholder (Loading Indicator)
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error, // Error Icon if image fails to load
                      size: 50,
                    ),
                    height: 70,
                    width: 70,
                  ),
                ),
              ),
              SizedBox(
                width: 3.0.w,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? "-",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email ?? "",
                    style: TextStyle(fontSize: 13.0, color: whiteColor),
                  ),
                ],
              )),
              SizedBox(
                width: 3.0.w,
              ),
              MaterialButton(
                padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                height: 30.0,
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                  pushScreen(context,
                      screen: const EditProfileScreen(), withNavBar: false);
                },
                minWidth: 15.0.w,
                color: whiteColor,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 16.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(color: primaryColor, fontSize: 14.0),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 3.0.w,
              ),
            ],
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Divider(
            color: whiteColor.withOpacity(0.5),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // pushScreen(context,
              //     screen: const SettingPlusScreen(), withNavBar: false);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 5.5.w,
                ),
                Image.asset(
                  "assets/images/premium.png",
                  width: 55.0,
                  height: 55.0,
                ),
                SizedBox(width: 4.5.w),
                const Text(
                  "Become A Premium Member",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.5.h,
          ),
          Container(
            width: 90.0.w,
            height: 70.0,
            padding: EdgeInsets.only(left: 5.5.w, right: 5.5.w),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Profile completeness:"),
                    const SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.0.w,
                          child: LinearProgressBar(
                              maxSteps: 10,
                              progressType:
                                  LinearProgressBar.progressTypeLinear,
                              currentStep: 6,
                              progressColor: primaryColor,
                              backgroundColor: Colors.grey.shade400),
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        const Text("60%"),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: primaryColor,
                  padding: EdgeInsets.zero,
                  height: 30.0,
                  child: const Text(
                    "Complete",
                    style: TextStyle(
                        color: whiteColor, height: 0.8, fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.5.h,
          ),
          ListTile(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              pushScreen(context,
                  screen:  AccountSettingScreen(), withNavBar: false);
            },
            trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
            leading: Image.asset(
              "assets/images/account_setting.png",
              width: 45.0,
              height: 45.0,
            ),
            hoverColor: Colors.grey,
            title: const Text(
              "Account Setting",
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          ListTile(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // pushScreen(context,
              //     screen: const SecurityPrivacyScreen(), withNavBar: false);
            },
            trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
            leading: Image.asset(
              "assets/images/security_setting.png",
              width: 45.0,
              height: 45.0,
            ),
            hoverColor: Colors.grey,
            title: const Text(
              "Security Setting",
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          ListTile(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              // pushScreen(context,
              //     screen: const TermsConditionScreen(), withNavBar: false);
            },
            trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
            leading: Image.asset(
              "assets/images/terms_condition_setting.png",
              width: 45.0,
              height: 45.0,
            ),
            hoverColor: Colors.grey,
            title: const Text(
              "Terms & Codnitions",
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          ListTile(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              pushScreen(context,
                  screen: const PrivacyPolicyScreen(), withNavBar: false);
            },
            trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
            leading: Image.asset(
              "assets/images/privacy_policy.png",
              width: 45.0,
              height: 45.0,
            ),
            hoverColor: Colors.grey,
            title: const Text(
              "Privacy Policy",
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          //    const Spacer(),
          ListTile(
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              await sharedPreferences.clear();
              nextScreenReplace(context, const SplashScreen());
            },
            trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
            leading: Image.asset(
              "assets/images/logout.png",
              width: 45.0,
              height: 45.0,
            ),
            hoverColor: Colors.grey,
            title: const Text(
              "Logout",
              style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
        ],
      ),
    );
  }
}
