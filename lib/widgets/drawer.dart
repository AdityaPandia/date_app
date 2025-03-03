import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/screens/signin_screen.dart';
import 'package:seting_app/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../drawer/account_setting_screen.dart';
import '../drawer/edit_profile_screen.dart';
import '../drawer/privacy_policy_screen.dart';
import '../drawer/profile_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../services/web_api.dart';
import '../utils/constants.dart';
import '../utils/shared_pref/shared_pref_keys.dart';

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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevents overflow
            children: [
              SizedBox(height: 3.5.h),
              _buildProfileSection(),
              SizedBox(height: 2.5.h),
              Divider(color: whiteColor.withOpacity(0.5)),
              SizedBox(height: 2.5.h),
              _buildPremiumSection(),
              SizedBox(height: 3.5.h),
              _buildProfileCompleteness(),
              SizedBox(height: 3.5.h),
              _buildMenuOptions(),
              SizedBox(height: 1.5.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Profile Section
  Widget _buildProfileSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).closeDrawer();
              pushScreen(context,
                  screen: const ProfileScreen(), withNavBar: false);
            },
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: displayPhoto ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Image.asset("assets/images/a1.png"),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 50),
                height: 70,
                width: 70,
              ),
            ),
          ),
          SizedBox(width: 3.0.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? "-",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: whiteColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(email ?? "",
                    style: TextStyle(fontSize: 13.0, color: whiteColor)),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 30.0,
            onPressed: () {
              Scaffold.of(context).closeDrawer();
              pushScreen(context,
                  screen:  EditProfileScreen(), withNavBar: false);
            },
            color: whiteColor,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, size: 16.0),
                SizedBox(width: 8.0),
                Text("Edit",
                    style: TextStyle(color: primaryColor, fontSize: 14.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Premium Membership Section
  Widget _buildPremiumSection() {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        // pushScreen(context, screen: const SettingPlusScreen(), withNavBar: false);
      },
      child: Row(
        children: [
          SizedBox(width: 5.5.w),
          Image.asset("assets/images/premium.png", width: 55.0, height: 55.0),
          SizedBox(width: 4.5.w),
          const Text(
            "Become A Premium Member",
            style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
          ),
        ],
      ),
    );
  }

  /// Profile Completeness Section
  Widget _buildProfileCompleteness() {
    return Container(
      width: 90.0.w,
      padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 10),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Profile completeness:"),
                SizedBox(height: 1.0),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressBar(
                        maxSteps: 10,
                        progressType: LinearProgressBar.progressTypeLinear,
                        currentStep: 6,
                        progressColor: primaryColor,
                        backgroundColor: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(width: 2.5.w),
                    const Text("60%"),
                  ],
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: primaryColor,
            padding: EdgeInsets.zero,
            height: 30.0,
            child: const Text("Complete",
                style: TextStyle(color: whiteColor, fontSize: 12.0)),
          ),
        ],
      ),
    );
  }

  /// Menu Options
  Widget _buildMenuOptions() {
    return Column(
      children: [
        _buildMenuItem("Account Setting", "assets/images/account_setting.png",
            AccountSettingScreen()),
        _buildMenuItem(
            "Security Setting", "assets/images/security_setting.png", null),
        _buildMenuItem("Terms & Conditions",
            "assets/images/terms_condition_setting.png", null),
        _buildMenuItem("Privacy Policy", "assets/images/privacy_policy.png",
            const PrivacyPolicyScreen()),
        _buildLogoutButton(),
      ],
    );
  }

  /// Generic Menu Item
  Widget _buildMenuItem(String title, String iconPath, Widget? screen) {
    return ListTile(
      onTap: () {
        Scaffold.of(context).closeDrawer();
        if (screen != null)
          pushScreen(context, screen: screen, withNavBar: false);
      },
      trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
      leading: Image.asset(iconPath, width: 45.0, height: 45.0),
      title: Text(title,
          style:
              const TextStyle(color: whiteColor, fontWeight: FontWeight.bold)),
    );
  }

  /// Logout Button
  Widget _buildLogoutButton() {
    return ListTile(
      onTap: logoutUser,
      trailing: SvgPicture.asset("assets/images/right_arrow.svg"),
      leading:
          Image.asset("assets/images/logout.png", width: 45.0, height: 45.0),
      title: const Text("Logout",
          style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold)),
    );
  }


  logoutUser() async {
    print("Logout user tapped");
    EasyLoading.show();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    EasyLoading.dismiss();

    print("Successful logout");

    // Ensure the bottom navigation is completely removed
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashScreen()),
            (route) => false, // Remove all routes
      );
    });

    // This ensures that the app is restarted cleanly (works best on Android)
    Future.delayed(const Duration(seconds: 1), () {
      SystemNavigator.pop();
    });
  }




}
