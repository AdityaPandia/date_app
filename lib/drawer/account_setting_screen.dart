import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/web_api.dart';
import '../utils/all_strings.dart';
import '../utils/constants.dart';
import '../utils/shared_pref/shared_pref_keys.dart';
import '../widgets/edit_card_widget.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  int isSelected = 0;
  RangeValues _currentRangeValues = const RangeValues(18, 30);
  bool showAge = true;
  bool showLocatoin = true;
  bool showOnlineStatus = true;
  double _value = 0.0;
  bool isAnyWhere = false;
  UserModel? userData = UserModel();

  String? accessToken;

  @override
  void initState() {
    getInitData();
    super.initState();
  }

  getInitData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      accessToken = prefs.getString(SharedPrefsKeys.accessToken);
      getProfile();
    });
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
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          "Account Setting",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
        child: Column(
          children: [
            SizedBox(
              height: 1.0.h,
            ),
            Card(
              surfaceTintColor: whiteColor,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "My Location Is",
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Tap to set location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0XFF718190), fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                    DottedBorder(
                      borderType: BorderType.Oval,
                      dashPattern: const [3, 2],
                      radius: const Radius.circular(12),
                      strokeWidth: 1.8,
                      color: primaryColor,
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: const BoxDecoration(
                            color: Color(0XFFf3f1fe), shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/location.svg"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Card(
              surfaceTintColor: whiteColor,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Radius",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          "${_value.toStringAsFixed(0)} Km",
                          style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Slider(
                      min: 0,
                      max: 1000,
                      value: _value,
                      activeColor: primaryColor,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isAnyWhere,
                          onChanged: (value) {
                            setState(() {
                              isAnyWhere = value!;
                            });
                          },
                        ),
                        const Text(
                          "Anywhere",
                          style: TextStyle(
                              color: blackColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Card(
              surfaceTintColor: whiteColor,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Interested in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14.0),
                              decoration: BoxDecoration(
                                color: isSelected == 0
                                    ? primaryColor
                                    : transparentColor,
                                borderRadius: BorderRadius.circular(14.0),
                                border:
                                    Border.all(color: const Color(0XFFE8E6EA)),
                              ),
                              child: Text(
                                AppStrings.woman,
                                style: TextStyle(
                                  color:
                                      isSelected == 0 ? whiteColor : blackColor,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.5.w,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14.0),
                              decoration: BoxDecoration(
                                color: isSelected == 1
                                    ? primaryColor
                                    : transparentColor,
                                borderRadius: BorderRadius.circular(14.0),
                                border:
                                    Border.all(color: const Color(0XFFE8E6EA)),
                              ),
                              child: Text(
                                AppStrings.man,
                                style: TextStyle(
                                  color:
                                      isSelected == 1 ? whiteColor : blackColor,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.5.w,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(14.0),
                              decoration: BoxDecoration(
                                color: isSelected == 2
                                    ? primaryColor
                                    : transparentColor,
                                borderRadius: BorderRadius.circular(14.0),
                                border:
                                    Border.all(color: const Color(0XFFE8E6EA)),
                              ),
                              child: Text(
                                AppStrings.other,
                                style: TextStyle(
                                  color:
                                      isSelected == 2 ? whiteColor : blackColor,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected = 3;
                        });
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 25.0.w,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(14.0),
                          decoration: BoxDecoration(
                            color: isSelected == 3
                                ? primaryColor
                                : transparentColor,
                            borderRadius: BorderRadius.circular(14.0),
                            border: Border.all(color: const Color(0XFFE8E6EA)),
                          ),
                          child: Text(
                            "All",
                            style: TextStyle(
                              color: isSelected == 3 ? whiteColor : blackColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Card(
              surfaceTintColor: whiteColor,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Age Range",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          "18-99",
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      max: 99,
                      min: 18,
                      activeColor: primaryColor,
                      divisions: 5,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Card(
              surfaceTintColor: whiteColor,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Show Age"),
                        SizedBox(
                          height: 40.0,
                          child: Switch(
                            value: showAge,
                            onChanged: (value) {
                              setState(() {
                                showAge = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Show Location"),
                        SizedBox(
                          height: 40.0,
                          child: Switch(
                            value: showLocatoin,
                            onChanged: (value) {
                              setState(() {
                                showLocatoin = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Show online Status"),
                        SizedBox(
                          height: 40.0,
                          child: Switch(
                            value: showOnlineStatus,
                            onChanged: (value) {
                              setState(() {
                                showOnlineStatus = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/what_looking.svg", title: userData?.data?.lookingFor),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/excercise.svg", title: userData?.data?.exerciseHabbit),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/vacation.svg", title: userData?.data?.idealVocation),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(assetString: "assets/smoking.svg", title: userData?.data?.smoking),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/eating_habit.svg", title: userData?.data?.eatingHabbit),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(assetString: "assets/height.svg", title: userData?.data?.height),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(assetString: "assets/kids.svg", title: userData?.data?.aboutKids),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/zodiac_sign.svg", title: userData?.data?.zodiacSign),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/qualification.svg", title: userData?.data?.school),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/night_life.svg", title: userData?.data?.nightLife),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/cooking_skill.svg", title: userData?.data?.cookingSkills),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(assetString: "assets/drink.svg", title: userData?.data?.oftenDrink),
            SizedBox(
              height: 1.0.h,
            ),
            EditCardWidget(
                assetString: "assets/communication.svg",
                title: userData?.data?.communctionStyle),
            SizedBox(
              height: 2.5.h,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                minWidth: 90.0.w,
                height: 55.0,
                color: primaryColor,
                child: const Text(
                  "Apply",
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                onPressed: () {}),
            SizedBox(
              height: 1.5.h,
            ),
          ],
        ),
      ),
    );
  }
}
