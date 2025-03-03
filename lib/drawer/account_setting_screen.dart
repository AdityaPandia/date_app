import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/controller/edit_profile_controller.dart';
import 'package:seting_app/screens/account_setting_update_screen.dart';
import 'package:seting_app/screens/auth/register/select_communication/communication_screen.dart';
import 'package:seting_app/screens/auth/register/select_cooking_skills/cooking_skill_screen.dart';
import 'package:seting_app/screens/auth/register/select_dring/drink_screen.dart';
import 'package:seting_app/screens/auth/register/select_eating_habit/eating_habit_screen.dart';
import 'package:seting_app/screens/auth/register/select_excercise/excercise_screen.dart';
import 'package:seting_app/screens/auth/register/select_height/height_screen.dart';
import 'package:seting_app/screens/auth/register/select_kids/kids_screen.dart';
import 'package:seting_app/screens/auth/register/select_night_life/night_life_screen.dart';
import 'package:seting_app/screens/auth/register/select_qualification/qualification_screen.dart';
import 'package:seting_app/screens/auth/register/select_relationship/relation_screen.dart';
import 'package:seting_app/screens/auth/register/select_smoking/smoke_screen.dart';
import 'package:seting_app/screens/auth/register/select_vacation/vacation_screen.dart';
import 'package:seting_app/screens/auth/register/select_zodiac/zodiac_sign_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/web_api.dart';
import '../utils/all_strings.dart';
import '../utils/asset_strings.dart';
import '../utils/constants.dart';
import '../utils/shared_pref/shared_pref_keys.dart';
import '../widgets/edit_card_widget.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => AccountSettingScreenState();
}

class AccountSettingScreenState extends State<AccountSettingScreen> {
  int isSelected = 0;
  RangeValues _currentRangeValues = const RangeValues(18, 30);
  bool showAge = true;
  bool showLocatoin = true;
  bool showOnlineStatus = true;
  double _value = 0.0;
  bool isAnyWhere = false;
  UserModel? userData = UserModel();
  Position? _currentLocation;
  bool locationSelected = false;
  late bool locationPermission = false;
  late LocationPermission _permission;
  String currentAddress = '';
  Placemark? place;

  String? accessToken;
  final controller = Get.put(EditProfileController());
  @override
  void initState() {
    // getInitData();
    // getAddressFromCoordinates("37.4219983", "-122.084");
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

  getAddressFromCoordinates(String lat, String long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.tryParse(lat) ?? 0.0, double.tryParse(long) ?? 0.0);
      setState(() {
        place = placemarks[0];
        currentAddress = "${place?.locality}, ${place?.administrativeArea}";
      });
    } catch (e) {
      print("Error fetching address: $e");
      setState(() {
        currentAddress = "Unable to fetch address";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.fetchProfile();
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
      body: Obx(
        () => controller.isLoading.value == 0
            ? Center(
                child: const CircularProgressIndicator(),
              )
            : controller.isLoading.value == 2
                ? Text("Error")
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 1.0.h,
                        ),
                        // Card(
                        //   surfaceTintColor: whiteColor,
                        //   color: whiteColor,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(
                        //         left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         const Column(
                        //           mainAxisSize: MainAxisSize.max,
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Align(
                        //               alignment: Alignment.centerLeft,
                        //               child: Text(
                        //                 "My Location Is",
                        //                 style: TextStyle(
                        //                     color: blackColor,
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 16.0),
                        //               ),
                        //             ),
                        //             SizedBox(
                        //               height: 10.0,
                        //             ),
                        //             Text(
                        //               "Tap to set location",
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                   color: Color(0XFF718190), fontSize: 15.0),
                        //             ),
                        //             SizedBox(
                        //               height: 10.0,
                        //             ),
                        //           ],
                        //         ),
                        //         DottedBorder(
                        //           borderType: BorderType.Oval,
                        //           dashPattern: const [3, 2],
                        //           radius: const Radius.circular(12),
                        //           strokeWidth: 1.8,
                        //           color: primaryColor,
                        //           child: Container(
                        //             padding: const EdgeInsets.all(14.0),
                        //             decoration: const BoxDecoration(
                        //                 color: Color(0XFFf3f1fe), shape: BoxShape.circle),
                        //             child: SvgPicture.asset("assets/images/location.svg"),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Card(
                          color: whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "My Location Is",
                                          style: TextStyle(
                                              color: blackColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Obx(
                                        () => Text(
                                          controller.currentAddress.value,
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          maxLines: 4,
                                          style: const TextStyle(
                                              color: Color(0XFF718190),
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                    ],
                                  ),
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
                                        color: Color(0XFFf3f1fe),
                                        shape: BoxShape.circle),
                                    child: SvgPicture.asset(
                                        AssetsStrings.locationIcon),
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
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Radius",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
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
                                          color: blackColor,
                                          fontWeight: FontWeight.bold),
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
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Interested in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            print(
                                                controller.interestedIn.value);
                                            controller.interestedIn.value =
                                                AppStrings.woman;
                                            print(
                                                controller.interestedIn.value);
                                          },
                                          child: Obx(
                                            () => Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              decoration: BoxDecoration(
                                                color: controller.interestedIn
                                                            .value ==
                                                        AppStrings.woman
                                                    ? primaryColor
                                                    : transparentColor,
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                                border: Border.all(
                                                    color: const Color(
                                                        0XFFE8E6EA)),
                                              ),
                                              child: Text(
                                                AppStrings.woman,
                                                style: TextStyle(
                                                  color: controller.interestedIn
                                                              .value ==
                                                          AppStrings.woman
                                                      ? whiteColor
                                                      : blackColor,
                                                  fontSize: 13.0,
                                                ),
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
                                            print(
                                                controller.interestedIn.value);
                                            controller.interestedIn.value =
                                                AppStrings.man;
                                            print(
                                                controller.interestedIn.value);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(14.0),
                                            decoration: BoxDecoration(
                                              color: controller
                                                          .interestedIn.value ==
                                                      AppStrings.man
                                                  ? primaryColor
                                                  : transparentColor,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
                                            ),
                                            child: Text(
                                              AppStrings.man,
                                              style: TextStyle(
                                                color: controller.interestedIn
                                                            .value ==
                                                        AppStrings.man
                                                    ? whiteColor
                                                    : blackColor,
                                                fontSize: 13.0,
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
                                            controller.interestedIn.value =
                                                AppStrings.other;
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.all(14.0),
                                            decoration: BoxDecoration(
                                              color: controller
                                                          .interestedIn.value ==
                                                      AppStrings.other
                                                  ? primaryColor
                                                  : transparentColor,
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
                                            ),
                                            child: Text(
                                              AppStrings.other,
                                              style: TextStyle(
                                                color: controller.interestedIn
                                                            .value ==
                                                        AppStrings.other
                                                    ? whiteColor
                                                    : blackColor,
                                                fontSize: 13.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     setState(() {
                                //       isSelected = 3;
                                //     });
                                //   },
                                //   child: Align(
                                //     alignment: Alignment.center,
                                //     child: Container(
                                //       width: 25.0.w,
                                //       alignment: Alignment.center,
                                //       padding: const EdgeInsets.all(14.0),
                                //       decoration: BoxDecoration(
                                //         color: isSelected == 3
                                //             ? primaryColor
                                //             : transparentColor,
                                //         borderRadius:
                                //             BorderRadius.circular(14.0),
                                //         border: Border.all(
                                //             color: const Color(0XFFE8E6EA)),
                                //       ),
                                //       child: Text(
                                //         "All",
                                //         style: TextStyle(
                                //           color: isSelected == 3
                                //               ? whiteColor
                                //               : blackColor,
                                //           fontSize: 13.0,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Age Range",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    Text(
                                      controller.ageRange.value.toString(),
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
                                // RangeSlider(
                                //   values: _currentRangeValues,
                                //   max: 99,
                                //   min: 18,
                                //   activeColor: primaryColor,
                                //   divisions: 5,
                                //   labels: RangeLabels(
                                //     _currentRangeValues.start
                                //         .round()
                                //         .toString(),
                                //     _currentRangeValues.end.round().toString(),
                                //   ),
                                //   onChanged: (RangeValues values) {
                                //     setState(() {
                                //       _currentRangeValues = values;
                                //     });
                                //   },
                                // ),
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
                                left: 16.0,
                                right: 16.0,
                                top: 16.0,
                                bottom: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Show Age"),
                                    SizedBox(
                                      height: 40.0,
                                      child: Obx(
                                        () => Switch(
                                          value: controller.showAge.value,
                                          onChanged: (value) {
                                            controller.showAge.value = value;
                                            print(controller.showAge.value);
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Show Location"),
                                    SizedBox(
                                      height: 40.0,
                                      child: Obx(
                                        () => Switch(
                                          value: controller.showLocation.value,
                                          onChanged: (value) {
                                            controller.showLocation.value =
                                                value;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Show online Status"),
                                    SizedBox(
                                      height: 40.0,
                                      child: Obx(
                                        () => Switch(
                                          value:
                                              controller.showOnlineStatus.value,
                                          onChanged: (value) {
                                            controller.showOnlineStatus.value =
                                                value;
                                          },
                                        ),
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
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: RelationScreen(
                                    onDataUpdated: (String x, dynamic y) {
                                      print(y);
                                      controller.lookingFor.value = y;
                                    },
                                    formKey: GlobalKey(),
                                    onSkip: () {},
                                    onBack: () {},
                                    onContinue: () {}),
                              ));
                              // Get.to(
                              // RelationScreen(
                              //     onDataUpdated: (String x, dynamic y) {},
                              //     formKey: GlobalKey(),
                              //     onSkip: () {},
                              //     onBack: () {},
                              //     onContinue: () {})
                              // );
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/what_looking.svg",
                                title: controller.lookingFor.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: ExcerciseScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.exerciseHabbit.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/excercise.svg",
                                title: controller.exerciseHabbit.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: VacationScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.idealVocation.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/vacation.svg",
                                title: controller.idealVocation.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: SmokeScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.smoking.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/smoking.svg",
                                title: controller.smoking.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: EatingHabitScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.eatingHabbit.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/eating_habit.svg",
                                title: controller.eatingHabbit.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: HeightScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.height.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: AssetsStrings.heightIcon,
                                title: controller.height.value,
                                isNotSvg: true),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: KidsScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.aboutKids.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/kids.svg",
                                title: controller.aboutKids.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: ZodiacSignScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.zodiacSign.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/zodiac_sign.svg",
                                title: controller.zodiacSign.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: QualificationScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.qualification.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/qualification.svg",
                                title: controller.qualification.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: NightLifeScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.nightLife.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/night_life.svg",
                                title: controller.nightLife.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: CookingSkillScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.cookingSkills.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/cooking_skill.svg",
                                title: controller.cookingSkills.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              // Get.to(CommunicationScreenEdit());
                              Get.to(AccountSettingUpdateScreen(
                                question: DrinkScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.oftenDrink.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/drink.svg",
                                title: controller.oftenDrink.value),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(AccountSettingUpdateScreen(
                                question: CommunicationScreen(
                                  onDataUpdated: (String x, dynamic y) {
                                    print(y);
                                    controller.communctionStyle.value = y;
                                  },
                                  formKey: GlobalKey(),
                                  onSkip: () {},
                                  onBack: () {},
                                ),
                              ));
                            },
                            child: EditCardWidget(
                                assetString: "assets/images/communication.svg",
                                title: controller.communctionStyle.value),
                          ),
                        ),
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
                            onPressed: () async {
                              await controller.patchProfile(
                                {
                                  "showMe": controller.interestedIn.value,
                                  "ageRange": 18,
                                  "hideBirthday": controller.showAge.value,
                                  "hideLocation":
                                      !controller.showLocation.value,
                                  "hideOnline":
                                      !controller.showOnlineStatus.value,
                                  "lookingFor": controller.lookingFor.value,
                                  "exercise": controller.exerciseHabbit.value,
                                  "idealVocation":
                                      controller.idealVocation.value,
                                  "smoking": controller.smoking.value,
                                  "eatingHabbit": controller.eatingHabbit.value,
                                  "height": controller.height.value,
                                  "aboutKids": controller.aboutKids.value,
                                  "zodiacSign": controller.zodiacSign.value,
                                  "qualification":
                                      controller.qualification.value,
                                  "nightLife": controller.nightLife.value,
                                  "cookingSkills":
                                      controller.cookingSkills.value,
                                  "oftenDrink": controller.oftenDrink.value,
                                  "communctionStyle":
                                      controller.communctionStyle.value,
                                },
                              );
                            }),
                        SizedBox(
                          height: 1.5.h,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
// import '../helpers/constants.dart';
// import '../models/user_account_settings_model.dart';
// import '../models/user_profile_model.dart';
//
// class AccountSettingsLandingWidget extends ConsumerWidget {
//   final Widget Function(UserProfileModel data)? builder;
//
//   const AccountSettingsLandingWidget({
//     Key? key,
//     this.builder,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(userProfileNotifier);
//
//     return user == null
//         ? const ErrorPage()
//         : builder == null
//         ? AccountSettingsPage(user: user)
//         : builder!(user);
//   }
// }
//
// class AccountSettingsPage extends ConsumerStatefulWidget {
//   final UserProfileModel user;
//
//   const AccountSettingsPage({Key? key, required this.user}) : super(key: key);
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _AccountSettingsPageState();
// }
//
// class _AccountSettingsPageState extends ConsumerState<AccountSettingsPage> {
//   late UserLocation _userLocation;
//   late double _distanceInKm;
//   late bool _isWorldWide;
//   late double _maxDistanceInKm;
//   late double _minimumAge;
//   late double _maximumAge;
//   String? _interestedIn;
//   bool? _showAge;
//   bool? _showLocation;
//   bool? _showOnlineStatus;
//
//   List<QuestionsModel> questions = [
//     QuestionsModel(
//       heading: "What are you looking at seting?",
//       items: [
//         "A Relationship",
//         "Nothing Series",
//         "I know when I will find it",
//       ],
//     ),
//     QuestionsModel(
//       heading: "What are your exercise habits?",
//       items: [
//         "Occasional",
//         "Enough cardio to keep up",
//         "All excerise all the time",
//       ],
//     ),
//     QuestionsModel(
//       heading: "What two words best describe your ideal vacation?",
//       items: [
//         "Hiking & backpack",
//         "Deckchair & sunscreen",
//         "Museum & postcards",
//       ],
//     ),
//     QuestionsModel(
//       heading: "Your opinion on smoking?",
//       items: [
//         "Well, I smoke",
//         "Not a fan, but whatever",
//         "Zero tolerance",
//       ],
//     ),
//     QuestionsModel(
//       heading: "What are your eating habits?",
//       items: [
//         "A little of everything",
//         "Flexitarian",
//         "Vegetarian",
//         "Vegan",
//         "Halal",
//         "Kosher",
//       ],
//     ),
//     QuestionsModel(
//       heading: "What about kids?",
//       items: [
//         "I live the ones I have",
//         "I have some, but want more",
//         "I'd like some, thanks",
//         "Thanks, but no thanks",
//       ],
//     ),
//     QuestionsModel(
//       heading: "When it comes to nightlife...",
//       items: [
//         "I'm in bed by midnight",
//         "I party in moderation",
//         "I'm night owl",
//       ],
//     ),
//     QuestionsModel(
//       heading: "Which answer best describes your cooking skills?",
//       items: [
//         "I'm a microwave master",
//         "I'm delivery expert",
//         "I know a few good recipes",
//         "I'm an excellent chef",
//       ],
//     ),
//   ];
//
//   @override
//   void initState() {
//     _distanceInKm = widget.user.userAccountSettingsModel.distanceInKm ??
//         AppConfig.initialMaximumDistanceInKM;
//     _isWorldWide = widget.user.userAccountSettingsModel.distanceInKm == null;
//     _interestedIn = widget.user.showMe;
//
//     _userLocation = widget.user.userAccountSettingsModel.location;
//     _minimumAge = widget.user.userAccountSettingsModel.minimumAge.toDouble();
//     _maximumAge = widget.user.userAccountSettingsModel.maximumAge.toDouble();
//
//     _maxDistanceInKm = AppConfig.initialMaximumDistanceInKM;
//
//     _showAge = widget.user.userAccountSettingsModel.showAge;
//     _showLocation = widget.user.userAccountSettingsModel.showLocation;
//     _showOnlineStatus = widget.user.userAccountSettingsModel.showOnlineStatus;
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Account Settings'),
//       ),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(AppConstants.defaultNumericValue),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // const SizedBox(height: AppConstants.defaultNumericValue),
//             Text(
//               'Location',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//
//             const SizedBox(height: AppConstants.defaultNumericValue / 2),
//             Text(
//                 'This is your location. Other users will be able to see you if they are within this range.',
//                 style: Theme.of(context).textTheme.bodySmall),
//             const SizedBox(height: AppConstants.defaultNumericValue),
//             GestureDetector(
//               onTap: () async {
//                 final newLocation = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const SetUserLocation()));
//
//                 if (newLocation != null) {
//                   setState(() {
//                     _userLocation = newLocation;
//                   });
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(AppConstants.defaultNumericValue),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Theme.of(context).primaryColor,
//                   ),
//                   borderRadius: BorderRadius.circular(
//                     AppConstants.defaultNumericValue,
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.location_on,
//                         color: AppConstants.primaryColor,
//                       ),
//                       const SizedBox(
//                           width: AppConstants.defaultNumericValue / 2),
//                       Text(
//                         _userLocation.addressText,
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyLarge!
//                             .copyWith(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: AppConstants.defaultNumericValue * 2),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Radius',
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(width: AppConstants.defaultNumericValue),
//                 if (!_isWorldWide)
//                   Text(
//                     '${_distanceInKm.toInt()} km',
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: AppConstants.primaryColor),
//                   ),
//               ],
//             ),
//             const SizedBox(height: AppConstants.defaultNumericValue / 2),
//             Text('This radius is used to find other users within this range.',
//                 style: Theme.of(context).textTheme.bodySmall),
//             const SizedBox(height: AppConstants.defaultNumericValue),
//             if (!_isWorldWide)
//               Slider(
//                 value: _distanceInKm,
//                 min: 1,
//                 max: _maxDistanceInKm,
//                 onChanged: (value) {
//                   setState(() {
//                     _distanceInKm = value;
//                   });
//                 },
//               ),
//
//             Card(
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 borderRadius:
//                 BorderRadius.circular(AppConstants.defaultNumericValue),
//               ),
//               borderOnForeground: true,
//               child: CheckboxListTile(
//                 value: _isWorldWide,
//                 controlAffinity: ListTileControlAffinity.leading,
//                 onChanged: (value) {
//                   setState(() {
//                     _isWorldWide = value!;
//                     _distanceInKm = value
//                         ? AppConfig.initialMaximumDistanceInKM
//                         : widget.user.userAccountSettingsModel.distanceInKm ??
//                         AppConfig.initialMaximumDistanceInKM;
//                   });
//                 },
//                 title: Text(
//                   "Anywhere",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyLarge!
//                       .copyWith(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             const SizedBox(height: AppConstants.defaultNumericValue * 2),
//             Text("Interested In",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(fontWeight: FontWeight.bold)),
//             const SizedBox(height: AppConstants.defaultNumericValue / 2),
//             Text('This is the type of people you are interested in.',
//                 style: Theme.of(context).textTheme.bodySmall),
//             const SizedBox(height: AppConstants.defaultNumericValue),
//             Wrap(
//               alignment: WrapAlignment.center,
//               spacing: AppConstants.defaultNumericValue / 2,
//               runSpacing: AppConstants.defaultNumericValue / 2,
//               children: [
//                 _GenderButton(
//                   text: AppConfig.maleText.toUpperCase(),
//                   isSelected: _interestedIn == AppConfig.maleText,
//                   onPressed: () {
//                     setState(() {
//                       _interestedIn = AppConfig.maleText;
//                     });
//                   },
//                 ),
//                 _GenderButton(
//                   text: AppConfig.femaleText.toUpperCase(),
//                   isSelected: _interestedIn == AppConfig.femaleText,
//                   onPressed: () {
//                     setState(() {
//                       _interestedIn = AppConfig.femaleText;
//                     });
//                   },
//                 ),
//                 if (AppConfig.allowTransGender)
//                   _GenderButton(
//                     text: AppConfig.transText.toUpperCase(),
//                     isSelected: _interestedIn == AppConfig.transText,
//                     onPressed: () {
//                       setState(() {
//                         _interestedIn = AppConfig.transText;
//                       });
//                     },
//                   ),
//                 _GenderButton(
//                   text: AppConfig.allowTransGender
//                       ? "all".toUpperCase()
//                       : "both".toUpperCase(),
//                   isSelected: _interestedIn == null,
//                   onPressed: () {
//                     setState(() {
//                       _interestedIn = null;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: AppConstants.defaultNumericValue * 2),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text("Age Range",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleLarge!
//                           .copyWith(fontWeight: FontWeight.bold)),
//                 ),
//                 const SizedBox(width: AppConstants.defaultNumericValue),
//                 Text(
//                   '${_minimumAge.toInt()} - ${_maximumAge.toInt()}',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: AppConstants.primaryColor),
//                 ),
//               ],
//             ),
//             const SizedBox(height: AppConstants.defaultNumericValue / 2),
//             Text('This is the age range you are interested in.',
//                 style: Theme.of(context).textTheme.bodySmall),
//             const SizedBox(height: AppConstants.defaultNumericValue),
//             RangeSlider(
//               values:
//               RangeValues(_minimumAge.toDouble(), _maximumAge.toDouble()),
//               min: AppConfig.minimumAgeRequired.toDouble(),
//               max: AppConfig.maximumUserAge.toDouble(),
//               onChanged: (RangeValues values) {
//                 setState(() {
//                   _minimumAge = values.start;
//                   _maximumAge = values.end;
//                 });
//               },
//             ),
//             const SizedBox(height: AppConstants.defaultNumericValue),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Show Age",
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith(fontWeight: FontWeight.bold)),
//                 Switch.adaptive(
//                   value: _showAge ?? true,
//                   onChanged: (value) {
//                     setState(() {
//                       _showAge = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             Text('If not enabled, your age will be hidden from others.',
//                 style: Theme.of(context).textTheme.bodySmall),
//             const SizedBox(height: AppConstants.defaultNumericValue * 2),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Show Location",
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith(fontWeight: FontWeight.bold)),
//                 Switch.adaptive(
//                   value: _showLocation ?? true,
//                   onChanged: (value) {
//                     setState(() {
//                       _showLocation = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             Text('If not enabled, your location will be hidden from others.',
//                 style: Theme.of(context).textTheme.bodySmall),
//
//             const SizedBox(height: AppConstants.defaultNumericValue * 2),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Show Online Status",
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge!
//                         .copyWith(fontWeight: FontWeight.bold)),
//                 Switch.adaptive(
//                   value: _showOnlineStatus ?? true,
//                   onChanged: (value) {
//                     setState(() {
//                       _showOnlineStatus = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             Text(
//                 'If not enabled, your online status will be hidden from others.',
//                 style: Theme.of(context).textTheme.bodySmall),
//
//             Builder(
//               builder: (context) {
//                 final questions = widget.user.happeningQuestion;
//
//                 return Column(
//                   children: [
//                     HappeningItem(
//                       happeningQuestion: questions!,
//                       items: this.questions[0].items,
//                       userId: widget.user.userId,
//                       heading: "What are you looking at seting?",
//                       value: questions.whatAreYouLooking ?? "N/A",
//                       onPress: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditQuestion(
//                               happeningQuestion: questions,
//                               heading: "What are you looking at seting?",
//                               items: this.questions[0].items,
//                               defaultValue: questions.whatAreYouLooking ?? "",
//                               userId: widget.user.userId,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[1].items,
//                       userId: widget.user.userId,
//                       heading: "What are your exercise habits?",
//                       value: questions.whatAreYourExercise ?? "N/A",
//                       onPress: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditQuestion(
//                               happeningQuestion: questions,
//                               heading: "What are your exercise habits?",
//                               items: this.questions[1].items,
//                               defaultValue: questions.whatAreYourExercise ?? "",
//                               userId: widget.user.userId,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[2].items,
//                       userId: widget.user.userId,
//                       heading:
//                       "What two words best describe your ideal vacation?",
//                       value:
//                       questions.whichAnswerBestDescribYourCooking ?? "N/A",
//                       onPress: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EditQuestion(
//                               happeningQuestion: questions,
//                               heading:
//                               "What two words best describe your ideal vacation?",
//                               items: this.questions[2].items,
//                               defaultValue:
//                               questions.whichAnswerBestDescribYourCooking ??
//                                   "",
//                               userId: widget.user.userId,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[3].items,
//                       userId: widget.user.userId,
//                       heading: "Your opinion on smoking?",
//                       value: questions.yourOpinionOnSmoking ?? "N/A",
//                       onPress: () {},
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[4].items,
//                       userId: widget.user.userId,
//                       heading: "What are your eating habits?",
//                       value: questions.whatAreYourEatingHabits ?? "N/A",
//                       onPress: () {},
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[5].items,
//                       userId: widget.user.userId,
//                       heading: "What about kids?",
//                       value: questions.whatAboutKids ?? "N/A",
//                       onPress: () {},
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[6].items,
//                       userId: widget.user.userId,
//                       heading: "When it comes to nightlife...",
//                       value: questions.whenItComesToNightlife ?? "N/A",
//                       onPress: () {},
//                     ),
//                     HappeningItem(
//                       happeningQuestion: questions,
//                       items: this.questions[7].items,
//                       userId: widget.user.userId,
//                       heading:
//                       "Which answer best describes your cooking skills?",
//                       value:
//                       questions.whichAnswerBestDescribYourCooking ?? "N/A",
//                       onPress: () {},
//                     ),
//                   ],
//                 );
//               },
//             ),
//
//             const SizedBox(height: AppConstants.defaultNumericValue * 2),
//           ],
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(AppConstants.defaultNumericValue),
//           child: CustomButton(
//             onPressed: () async {
//               final UserAccountSettingsModel userAccountSettingsModel =
//               UserAccountSettingsModel(
//                 distanceInKm:
//                 _isWorldWide ? null : _distanceInKm.toInt().toDouble(),
//                 interestedIn: _interestedIn,
//                 minimumAge: _minimumAge.toInt(),
//                 maximumAge: _maximumAge.toInt(),
//                 location: _userLocation,
//                 showAge: _showAge,
//                 showLocation: _showLocation,
//                 showOnlineStatus: _showOnlineStatus,
//               );
//
//               final userProfileModel = widget.user.copyWith(
//                 userAccountSettingsModel: userAccountSettingsModel,
//                 isOnline: _showOnlineStatus == false ? false : true,
//               );
//               EasyLoading.show(status: 'Updating...');
//
//               await ref
//                   .read(userProfileNotifier.notifier)
//                   .updateUserProfile(userProfileModel)
//                   .then((value) {
//                 ref.invalidate(userProfileNotifier);
//                 EasyLoading.dismiss();
//                 Navigator.pop(context);
//               });
//             },
//             text: 'Apply',
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _GenderButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String text;
//   final bool isSelected;
//
//   const _GenderButton({
//     Key? key,
//     required this.onPressed,
//     required this.text,
//     required this.isSelected,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: AppConstants.defaultNumericValue * 1.5,
//           vertical: AppConstants.defaultNumericValue,
//         ),
//         decoration: BoxDecoration(
//           color: isSelected
//               ? AppConstants.primaryColor
//               : AppConstants.primaryColor.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(
//             AppConstants.defaultNumericValue,
//           ),
//           boxShadow: isSelected
//               ? [
//             BoxShadow(
//               color: AppConstants.primaryColor.withOpacity(0.2),
//               blurRadius: AppConstants.defaultNumericValue,
//               offset: const Offset(0, 8),
//             ),
//           ]
//               : null,
//         ),
//         child: Text(
//           text,
//           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//             color: isSelected ? Colors.white : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
