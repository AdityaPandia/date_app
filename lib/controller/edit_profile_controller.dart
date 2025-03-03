import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:seting_app/drawer/account_setting_screen.dart';
import 'package:seting_app/models/user_model.dart';
import 'package:seting_app/services/web_api.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {
  final String accessToken = '';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchProfile();
  }

  RxInt isLoading = 0.obs;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController livingInController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  RxString interest = ''.obs;
  RxString orientation = ''.obs;

  //Account setting specific
  RxString interestedIn = "".obs;
  RxInt ageRange = 0.obs;
  RxBool showAge = false.obs;
  RxBool showLocation = false.obs;
  RxBool showOnlineStatus = false.obs;
  RxString lookingFor = "".obs;
  RxString exerciseHabbit = "".obs;
  RxString idealVocation = "".obs;
  RxString smoking = "".obs;
  RxString eatingHabbit = "".obs;
  RxString height = "".obs;
  RxString aboutKids = "".obs;
  RxString zodiacSign = "".obs;
  RxString qualification = "".obs;
  RxString nightLife = "".obs;
  RxString cookingSkills = "".obs;
  RxString communicationStyle = "".obs;
  RxString oftenDrink = "".obs;
  RxString communctionStyle = "".obs;

  bool validateEditProfileUpdate() {
    if (fullNameController.text.isEmpty) {
      return false;
    } else if (emailController.text.isEmpty) {
      return false;
    } else if (schoolController.text.isEmpty) {
      return false;
    } else if (birthDateController.text.isEmpty) {
      return false;
    } else if (genderController.text.isEmpty) {
      return false;
    } else if (livingInController.text.isEmpty) {
      return false;
    } else if (jobTitleController.text.isEmpty) {
      return false;
    } else if (companyController.text.isEmpty) {
      return false;
    } else if (phoneController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  // bool validateAccountSettings(){

  // }

  Rx<Placemark> place = Placemark().obs;
  RxString currentAddress = "".obs;

  getAddressFromCoordinates(String lat, String long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          double.tryParse(lat) ?? 0.0, double.tryParse(long) ?? 0.0);

      place.value = placemarks[0];
      currentAddress.value =
          "${place.value.locality}, ${place.value.administrativeArea}";
    } catch (e) {
      print("Error fetching address: $e");

      currentAddress.value = "Unable to fetch address";
    }
  }

  Rx<UserModel> fetchedProfileData = UserModel().obs;
  fetchProfile() async {
    try {
      isLoading.value = 0;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? accessToken = prefs.getString(SharedPrefsKeys.accessToken);
      var headers = {'Authorization': 'Bearer $accessToken'};
      var data = '''''';
      var dio = Dio();
      var response = await dio.request(
        'http://15.207.115.155/api/user/profile',
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));

        fetchedProfileData.value = UserModel.fromJson(response.data);
        fullNameController.text = fetchedProfileData.value.data!.name!;
        emailController.text = fetchedProfileData.value.data!.email!;
        phoneController.text = fetchedProfileData.value.data!.phoneNumber!;
        schoolController.text = fetchedProfileData.value.data!.school!;
        birthDateController.text = fetchedProfileData.value.data!.birthday!;
        genderController.text = fetchedProfileData.value.data!.gender!;
        livingInController.text = fetchedProfileData.value.data!.livingIn!;
        jobTitleController.text = fetchedProfileData.value.data!.idealVocation!;
        companyController.text = fetchedProfileData.value.data!.company!;

        interestedIn.value = fetchedProfileData.value.data!.showMe!;
        ageRange.value = fetchedProfileData.value.data!.ageRange!;
        showAge.value = fetchedProfileData.value.data!.hideBirthday!;
        showLocation.value = fetchedProfileData.value.data!.hideLocation!;
        showOnlineStatus.value = fetchedProfileData.value.data!.hideOnline!;
        lookingFor.value = fetchedProfileData.value.data!.lookingFor!;
        exerciseHabbit.value = fetchedProfileData.value.data!.exerciseHabbit!;
        idealVocation.value = fetchedProfileData.value.data!.idealVocation!;
        smoking.value = fetchedProfileData.value.data!.smoking!;
        eatingHabbit.value = fetchedProfileData.value.data!.eatingHabbit!;
        height.value = fetchedProfileData.value.data!.height!;
        aboutKids.value = fetchedProfileData.value.data!.aboutKids!;
        zodiacSign.value = fetchedProfileData.value.data!.zodiacSign!;
        qualification.value = fetchedProfileData.value.data!.qualification!;
        nightLife.value = fetchedProfileData.value.data!.nightLife!;
        cookingSkills.value = fetchedProfileData.value.data!.cookingSkills!;
        communicationStyle.value =
            fetchedProfileData.value.data!.communicationStyle!;
        oftenDrink.value = fetchedProfileData.value.data!.oftenDrink!;

        /*


        */

        await getAddressFromCoordinates(fetchedProfileData.value.data!.lat!,
            fetchedProfileData.value.data!.long!);

        isLoading.value = 1;
      } else {
        print(response.statusMessage);
        isLoading.value = 2;
      }
    } catch (e) {
      isLoading.value = 2;
      print(e.toString());
      // CommonWidgets.showToast(e.toString());
    }
  }

  patchProfile(Map<String, Object> valuesToUpdate) async {
    /*
    These are required parameters for valuesToUpdate
 "ageRange": 18,
  "hideBirthday": true,
  "hideLocation": false,
  "hideOnline": false,
    */
    try {
      isLoading.value = 0;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? accessToken = prefs.getString(SharedPrefsKeys.accessToken);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      };
      var data = json.encode(valuesToUpdate);
      var dio = Dio();
      var response = await dio.request(
        'http://15.207.115.155/api/user/update',
        options: Options(
          method: 'PATCH',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        fetchProfile();
      } else {
        print(response.statusMessage);
        isLoading.value = 2;
      }
    } catch (e) {
      isLoading.value = 2;
    }
  }
}
