import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/models/user_model.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/web_api.dart';
import '../utils/constants.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index = 0;
  int isSelected = -1;
  String? accessToken;
  String? email;
  String? name;
  String? displayPhoto;
  UserModel? userData = UserModel();
  @override
  void initState() {
    getInitData();
    print("INSIDE PROFILE SCREEN");
    super.initState();
  }

  getInitData() async {
    print("INSIDE getInitData ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      accessToken = prefs.getString(SharedPrefsKeys.accessToken);
      email = prefs.getString(SharedPrefsKeys.userEmail);
      name = prefs.getString(SharedPrefsKeys.userName);
      displayPhoto = prefs.getString(SharedPrefsKeys.userDisplayPhoto);
    });
    await getProfile();
  }

  getProfile() async {
    print("Access Token: $accessToken");
    UserModel? userModel = await WebConfig.getProfile(
      accessToken: accessToken ?? "",
    );
    if (userModel != null && userModel.success == true) {
      setState(() {
        userData = userModel;
      });
    } else {
      print("Failed to fetch profile data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f1fe),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: whiteColor),
        actions: [
          const Icon(
            Icons.edit_square,
            color: whiteColor,
          ),
          SizedBox(
            width: 4.5.w,
          ),
        ],
        title: Text(
          "Profile",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 45.0),
                  color: primaryColor,
                  width: 100.0.w,
                  height: 70.0,
                ),
                CachedNetworkImage(
                  imageUrl: displayPhoto ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: Image.asset(
                        "assets/images/a1.png"), // Placeholder (Loading Indicator)
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error, // Error Icon if image fails to load
                    size: 100,
                  ),
                  height: 100,
                  width: 100,
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              name ?? "-",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            Text(
              email ?? "-",
              style: const TextStyle(fontSize: 13.0),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w, top: 2.5.h),
              padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: [
                  DefaultTabController(
                    initialIndex: index,
                    length: 3,
                    child: TabBar(
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelStyle: const TextStyle(
                          fontFamily: "SKModernist",
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                      labelStyle: const TextStyle(
                          fontFamily: "SKModernist",
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: primaryColor),
                      unselectedLabelColor: Colors.grey,
                      labelColor: primaryColor,
                      dividerColor: transparentColor,
                      onTap: (val) {
                        setState(() {
                          index = val;
                        });
                      },
                      tabs: const [
                        Tab(
                          child: Text(
                            "About",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Gallery",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Feed",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            [
              Column(
                children: [
                  Card(
                    color: whiteColor,
                    surfaceTintColor: whiteColor,
                    margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
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
                                        progressType: LinearProgressBar
                                            .progressTypeLinear,
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
                                  color: whiteColor,
                                  height: 0.8,
                                  fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(fieldName: "Phone Number", value: "-"),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(fieldName: "About me", value: "-"),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(
                      fieldName: "Birthday",
                      value: userData?.data?.birthday.toString()),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(
                      fieldName: "Gender", value: userData?.data?.gender),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(
                      fieldName: "School", value: userData?.data?.school),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(fieldName: "Job Title", value: "-"),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(fieldName: "Company", value: "-"),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ProfileItem(fieldName: "Living in", value: "-"),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    width: double.infinity,
                    child: Card(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      color: whiteColor,
                      surfaceTintColor: whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Interested",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Wrap(
                              spacing: 8.0, // Space between items horizontally
                              runSpacing: 8.0, // Space between rows
                              children: (userData?.data?.interest ?? []).map((interestItem) {
                                return Container(
                                  width: (MediaQuery.of(context).size.width - 32) / 3, // Adjusted for padding
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: Text(
                                    interestItem,
                                    style: const TextStyle(
                                      color: blackColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                );
                              }).toList(), // Ensures List<Widget>
                            ),


                            const SizedBox(
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Card(
                    margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                    color: whiteColor,
                    surfaceTintColor: whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Orientation",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: transparentColor,
                                    borderRadius: BorderRadius.circular(14.0),
                                    border: Border.all(
                                        color: const Color(0XFFE8E6EA)),
                                  ),
                                  child: const Text(
                                    "Straight",
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),



                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                ],
              ),
            ][index],
          ],
        ),
      ),
    );
  }
}
