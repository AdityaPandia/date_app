import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seting_app/screens/auth/register/add_photo/add_photos_screen.dart';
import 'package:seting_app/screens/auth/register/additional_info/additional_info_screen.dart';
import 'package:seting_app/screens/auth/register/info_screen/info_screen.dart';
import 'package:seting_app/screens/auth/register/select_communication/communication_screen.dart';
import 'package:seting_app/screens/auth/register/select_cooking_skills/cooking_skill_screen.dart';
import 'package:seting_app/screens/auth/register/select_dring/drink_screen.dart';
import 'package:seting_app/screens/auth/register/select_eating_habit/eating_habit_screen.dart';
import 'package:seting_app/screens/auth/register/select_height/height_screen.dart';
import 'package:seting_app/screens/auth/register/select_kids/kids_screen.dart';
import 'package:seting_app/screens/auth/register/select_location/location_screen.dart';
import 'package:seting_app/screens/auth/register/select_night_life/night_life_screen.dart';
import 'package:seting_app/screens/auth/register/select_qualification/qualification_screen.dart';
import 'package:seting_app/screens/auth/register/select_relationship/relation_screen.dart';
import 'package:seting_app/screens/auth/register/select_smoking/smoke_screen.dart';
import 'package:seting_app/screens/auth/register/select_vacation/vacation_screen.dart';
import 'package:seting_app/screens/auth/register/select_zodiac/zodiac_sign_screen.dart';
import 'package:seting_app/screens/auth/register/select_excercise/excercise_screen.dart';
import 'package:seting_app/utils/constants.dart';
import 'package:seting_app/utils/routes.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';
import 'package:seting_app/widgets/app_themed_button.dart';

import '../../../../models/login_model_response.dart';
import '../../../../models/request/create_user_request.dart';
import '../../../../services/web_api.dart';

class BasicInfoScreen extends StatefulWidget {
  @override
  _BasicInfoScreenState createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final PageController _pageController = PageController();
  String? lookingForValue;

  final Map<int, List<String>> pageValidationRules = {
    0: ['gender'],
    1: ['showMe', 'interests'],
    2: ['images', 'sexialorientation'],
    3: ['lookingFor'],
    4: ['exercise'],
    5: ['idealVocation'],
    6: ['smoking'],
    7: ['eatingHabbit'],
    8: ['communctionStyle'],
    9: ['oftenDrink'],
    10: ['height'],
    11: ['aboutKids'],
    12: ['zodiacSign'],
    13: ['qualifcation'],
    14: ['nightLife'],
    15: ['cookingSkills'],
    16: ['lat', 'long']

    // Page 0 requires 'gender' to be non-null
//1: ['lookingFor'], // Page 1 requires 'lookingFor' to be non-null
    // Add other pages and their validation rules as needed
  };

  final Map<int, GlobalKey<FormState>> _formKeys = {
    0: GlobalKey<FormState>(),
    1: GlobalKey<FormState>(),
    2: GlobalKey<FormState>(),
    3: GlobalKey<FormState>(),
    4: GlobalKey<FormState>(),
    5: GlobalKey<FormState>(),
    6: GlobalKey<FormState>(),
    7: GlobalKey<FormState>(),
    8: GlobalKey<FormState>(),
    9: GlobalKey<FormState>(),
    10: GlobalKey<FormState>(),
    11: GlobalKey<FormState>(),
    12: GlobalKey<FormState>(),
    13: GlobalKey<FormState>(),
    14: GlobalKey<FormState>(),
    15: GlobalKey<FormState>(),
    16: GlobalKey<FormState>(),
  };

  final GlobalKey<InfoScreenState> _infoScreenKey =
      GlobalKey<InfoScreenState>();

  final CreateUserRequest _createUserRequest = CreateUserRequest();
  int _currentPage = 0;

  void _updateFormData(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // _createUserRequest.email = "ggffgf@gmail.com";

     _createUserRequest.email = prefs.getString(SharedPrefsKeys.userEmail);
    print("_createUserRequest.email: ${_createUserRequest.email}");
    final fieldMap = {
      'name': (dynamic v) => _createUserRequest.name = v,
      'gender': (dynamic v) => _createUserRequest.gender = v,
      'birthday': (dynamic v) => _createUserRequest.birthday = v,
      'school': (dynamic v) => _createUserRequest.school = v,
      'showMe': (dynamic v) => _createUserRequest.showMe = v,
      'interests': (dynamic v) => _createUserRequest.interests = v,
      'images': (dynamic v) => _createUserRequest.images = v,
      'smoking': (dynamic v) => _createUserRequest.smoking = v,
      'email': (dynamic v) => _createUserRequest.email = v,
      'sexialorientation': (dynamic v) =>
          _createUserRequest.sexialorientation = v,
      'lookingFor': (dynamic v) {
        _createUserRequest.lookingFor = v;
        lookingForValue = v; // Update the state variable for UI display
      },
      'exercise': (dynamic v) => _createUserRequest.exercies = v,
      'height': (dynamic v) => _createUserRequest.height = v,
      'idealVocation': (dynamic v) => _createUserRequest.idealVocation = v,
      'eatingHabbit': (dynamic v) => _createUserRequest.eatingHabbit = v,
      'communctionStyle': (dynamic v) =>
          _createUserRequest.communctionStyle = v,
      'oftenDrink': (dynamic v) => _createUserRequest.oftenDrink = v,
      'aboutKids': (dynamic v) => _createUserRequest.aboutKids = v,
      'zodiacSign': (dynamic v) => _createUserRequest.zodiacSign = v,
      'qualifcation': (dynamic v) => _createUserRequest.qualifcation = v,
      'nightLife': (dynamic v) => _createUserRequest.nightLife = v,
      'cookingSkills': (dynamic v) => _createUserRequest.cookingSkills = v,
      'lat': (dynamic v) => _createUserRequest.lat = v,
      'long': (dynamic v) => _createUserRequest.long = v,
    };

    setState(() {
      if (fieldMap.containsKey(key)) {
        fieldMap[key]!(value);
      } else {
        debugPrint('Invalid key: $key');
      }
    });
  }

  void _nextPage() {
    final currentFormKey = _formKeys[_currentPage];

    // Get the fields required for the current page
    final requiredFields = pageValidationRules[_currentPage] ?? [];

    // Validate each field for the current page
    for (String field in requiredFields) {
      final dynamic value = _getFieldValue(field);

      // Special case for the 'images' field
      if (field == 'images') {
        if (value == null || (value is List && value.length < 2)) {
          showSnackBar(context, "Please upload at least 2 photos to continue.");
          return; // Stop navigation if images are not sufficient
        }
      } else if (value == null || (value is List && value.isEmpty)) {
        showSnackBar(context, "Please provide a value to continue.");
        return; // Stop navigation if any other field is invalid
      }
    }

    // Validate the form for the current page (if applicable)
    if (currentFormKey != null &&
        currentFormKey.currentState != null &&
        !currentFormKey.currentState!.validate()) {
      setState(() {});
      debugPrint("Form is invalid. Fix errors before proceeding.");
      showSnackBar(context, "Please fix the errors in the form to proceed.");
      return;
    }

    // Navigate to the next page or submit the form
    if (_currentPage < _buildQuestions().length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      _submitForm();
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _skipPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage++;
    });
  }

  void _backPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    } else {
      // Navigate to the previous screen
      Navigator.pop(context);
    }
  }

  Future<void> _submitForm() async {
    final prefs = await SharedPreferences.getInstance();
    print("Collected Data: ${jsonEncode(_createUserRequest)}");

    var getData = await WebConfig.createUser(_createUserRequest);

    print("getData: ${getData}");
    // Check API response
    if (getData["success"] == true) {
      // Show success message
      await SnackBar(content: Text("Your Account Created Successfully"));
      // Call sign-in function
      LoginModelResponse? loginResponse =
      await WebConfig.signInWithEmail(
        emailString: getData["data"]["email"] ?? "",
      );
      if (loginResponse != null &&
          loginResponse.success == true) {
        // Save tokens to SharedPreferences
        await prefs.setString(
          SharedPrefsKeys.accessToken,
          loginResponse.data?.accessToken ?? '',
        );
        await prefs.setString(
          SharedPrefsKeys.userId,
          loginResponse.data?.id ?? '',
        );
        // Navigate to the dashboard
        if (context.mounted) {
          Navigator.pushReplacementNamed(
              context, Routes.dashBoard);
        }
      } else {
        // Show error message
        await EasyLoading.showError(
            "Login failed. Please try again.");
      }
    //  await EasyLoading.showSuccess("Your Account Created Successfully");
      // Navigate to the dashboard
      if (context.mounted) {

        Navigator.pushReplacementNamed(context, Routes.dashBoard);
      }
    } else {
      // Show error message
      await EasyLoading.showError(getData["error"]);
    }
  }

  List<Widget> _buildQuestions() {
    return [
      InfoScreen(
        onDataUpdated: _updateFormData,
        formKey: _formKeys[0]!,
        screenKey: _infoScreenKey,
      ),
      AdditionalInfoScreen(
        onDataUpdated: _updateFormData,
        formKey: _formKeys[1]!,
        onBack: _backPage,
      ),
      AddPhotosScreen(
        onDataUpdated: _updateFormData,
        formKey: _formKeys[2]!,
        onBack: _backPage,
      ),
      RelationScreen(
        onDataUpdated: _updateFormData,
        formKey: _formKeys[3]!,
        onSkip: _skipPage,
        onBack: _backPage,
        onContinue: _nextPage,
      ),
      ExcerciseScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[4]!,
          onBack: _backPage,
          onSkip: _skipPage),
      VacationScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[5]!,
          onBack: _backPage,
          onSkip: _skipPage),
      SmokeScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[6]!,
          onBack: _backPage,
          onSkip: _skipPage),
      EatingHabitScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[7]!,
          onBack: _backPage,
          onSkip: _skipPage),
      CommunicationScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[8]!,
          onBack: _backPage,
          onSkip: _skipPage),
      DrinkScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[9]!,
          onBack: _backPage,
          onSkip: _skipPage),
      HeightScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[10]!,
          onBack: _backPage,
          onSkip: _skipPage),
      KidsScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[11]!,
          onBack: _backPage,
          onSkip: _skipPage),
      ZodiacSignScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[12]!,
          onBack: _backPage,
          onSkip: _skipPage),
      QualificationScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[13]!,
          onBack: _backPage,
          onSkip: _skipPage),
      NightLifeScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[14]!,
          onBack: _backPage,
          onSkip: _skipPage),
      CookingSkillScreen(
          onDataUpdated: _updateFormData,
          formKey: _formKeys[15]!,
          onBack: _backPage,
          onSkip: _skipPage),
      LocationScreen(
        onDataUpdated: _updateFormData,
        formKey: _formKeys[16]!,
        onBack: _backPage,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: _buildQuestions(),
      ),
      bottomNavigationBar: Container(
        color: AppColors.lightPrimary,
        padding: const EdgeInsets.all(16.0),
        child: AppThemedButton(
          onPressed: _nextPage,
          withIcon: false,
          label: "Continue",
          backgroundColor: AppColors.primary,
          labelColor: AppColors.white,
        ),
      ),
    );
  }

  dynamic _getFieldValue(String key) {
    switch (key) {
      case 'gender':
        return _createUserRequest.gender;
      case 'showMe':
        return _createUserRequest.showMe;
      case 'interests':
        return _createUserRequest.interests;
      case 'images':
        return _createUserRequest.images;

      case 'sexialorientation':
        return _createUserRequest.sexialorientation;
      case 'lookingFor':
        return _createUserRequest.lookingFor;
      case 'exercise':
        return _createUserRequest.exercies;
      case 'idealVocation':
        return _createUserRequest.idealVocation;
      case 'smoking':
        return _createUserRequest.smoking;
      case 'eatingHabbit':
        return _createUserRequest.eatingHabbit;
      case 'communctionStyle':
        return _createUserRequest.communctionStyle;
      case 'oftenDrink':
        return _createUserRequest.oftenDrink;
      case 'height':
        return _createUserRequest.height;
      case 'aboutKids':
        return _createUserRequest.aboutKids;
      case 'zodiacSign':
        return _createUserRequest.zodiacSign;
      case 'qualifcation':
        return _createUserRequest.qualifcation;
      case 'nightLife':
        return _createUserRequest.nightLife;
      case 'cookingSkills':
        return _createUserRequest.cookingSkills;
      case 'zodiacSign':
        return _createUserRequest.zodiacSign;
      case 'lat':
        return _createUserRequest.lat;
      case 'long':
        return _createUserRequest.long;
      default:
        return null;
    }
  }
}
