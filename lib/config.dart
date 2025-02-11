import 'package:flutter/material.dart';

import 'helpers/get_color_from.hex.dart';

class AppConfig {
  AppConfig._();

  // ? This is the main configuration file for the app. You can change the app name, app primary color, chat background, user interaction buttons colors, etc. from here. All the main configuration settings are here. Please read the comments carefully before changing anything. Every comment is important. If you have any questions, please contact us. We are always happy to help you.

  ///
  /// App Primary Constants
  ///

//!!App Name. Change this to your app name
  static const String appName = "Seting";

//!! App Primary Color. Change this to your app primary color
  static HexColor primaryColor = HexColor("#6759bd");

  ///
  /// Chat Constants
  ///

  //!! Default Chat Background. Change the image in assets/images/chat_bg.png. Keep the image file name and format same as the name below. No need to change anything here.
  static const String defaultChatBg = "assets/images/chat_bg.png";

  //!! Chat Text Field and Other user message text color
  static const Color chatTextFieldAndOtherText =
  Color.fromARGB(255, 244, 238, 238);

  //!! My message text color
  static const Color chatMyTextColor = Color.fromARGB(255, 255, 193, 202);

  //!! Solid Colors for Chat Background. You can add more colors here or remove colors from here.
  static const List<Color> wallpaperSolidColors = [
    Colors.deepPurple,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.cyan,
    Colors.teal,
    Colors.lime,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.lightBlueAccent,
    Colors.deepOrange,
    Colors.deepOrangeAccent,
    Colors.brown,
    Colors.grey,
    Colors.white,
  ];

  ///
  /// User Interaction Buttons Settings
  ///

  //!! Dislike Button Color
  static const Color dislikeButtonColor = Color.fromARGB(255, 246, 40, 25);
  static const Color reloadButtonColor = Color.fromARGB(255, 246, 228, 25);

  //!! Super Like Button Color
  static const Color superLikeButtonColor = Color.fromARGB(255, 40, 205, 251);

  //!! Like Button Color
  static const Color likeButtonColor = Color.fromARGB(255, 120, 243, 124);
  static const Color boostButtonColor = Color.fromARGB(255, 255, 131, 15);

  //!! Show Interaction Button Text
  static const bool showInteractionButtonText = false;

  //!! Like Button Text
  static const String likeButtonText = "Like";

  //!! Super Like Button Text
  static const String superLikeButtonText = "Flash Note";
  static const String reloadButtonText = "Reload";
  static const String boostButtonText = "Boost";

  //!! Dislike Button Text
  static const String dislikeButtonText = "Dislike";

  ///
  /// Gender Settings
  ///

  //!! Change this to False if you don't want transgender
  static const bool allowTransGender = true;

  //!! Male gender text
  static const String maleText = "male";

  //!! Female Gender text
  static const String femaleText = "woman";

  //!! Other Gender text
  static const String transText = "other";

  ///
  /// Base settings for a new user
  ///

  //!! Initial Distance in KM to filter users
  static const double initialDistanceInKM = 500;

  //!! Initial Maximum Distance in KM to filter users
  static const double initialMaximumDistanceInKM = 1000;

  //!! Maximum default age to filter users
  static const int maximumUserAge = 99;

  ///
  /// Other Settings
  ///

  //!! Can a user change name?
  static const bool canChangeName = true;

  //!! Can user see other user profile if they don't have images?
  static const bool userProfileShowWithoutImages = true;

  //!! Minimum age required to use the app
  static const int minimumAgeRequired = 18;

  //!! Maximum number of media a user can upload
  static const int maxNumOfMedia = 6;

  //!! Maximum number of interests a user can select
  static const int maxNumOfInterests = 5;

  // !! Interests List for user to select! You can add more or remove some!
  static const List<String> interests = [
    "pets",
    "exercise",
    "dancing",
    "cooking",
    "politics",
    "sports",
    "photography",
    "art",
    "learning",
    "music",
    "movies",
    "books",
    "gaming",
    "food",
    "fashion",
    "technology",
    "science",
    "health",
    "business",
  ];
}

///
/// Authentication Modes
///

//!! Enable Google Authentication
const bool isGoogleAuthAvailable = true;

//!! Enable Facebook Authentication
const bool isFacebookAuthAvailable = true;

//!! Enable Phone Authentication
const bool isPhoneAuthAvailable = true;

///
/// Company Pages Setup
///

// ? Must Have These Two

//!! Terms and Conditions Page. You should use your own page or use this one.
const String termsAndConditionsUrl =
    "https://theseting.com/terms-and-condition.html";

//!! Privacy Policy Page. You should use your own page or use this one.
const String privacyPolicyUrl = "https://theseting.com/privacy-policy.html";

// ? These are optional

//!! If you have FAQ page, set this to true and set the url below
const bool isCompanyHasFAQ = false;

//! If you have About page, set this to true and set the url below
const bool isCompanyHasAbout = false;

//! If you have Contact page, set this to true and set the url below
const bool isCompanyHasContact = false;

//! FAQ Page URL
const String faqUrl = "";

//! Contact Page URL
const String contactUsUrl = "";

//! About Page URL
const String aboutUsUrl = "";

///
/// Location Settings
///

//!! Create this place api key from google cloud platform and paste here!
//!! Link: https://!console.cloud.google.com/apis/credentials
const String locationApiKey = "AIzaSyCze6OYgpj6YxcL2X6c9E7i60k5JLp3i-8";

///
/// Ads Settings
///

//! Enable Admob Ads or not. If you don't want ads, set this to false. If you want ads, set this to true and set the ad ids below.
const bool isAdmobAvailable = true;

class AndroidAdUnits {
  AndroidAdUnits._();

  //! Admob Android App Id
  static const String appId = "ca-app-pub-6642769090973188~7470481934";

  //! Admob Android Banner Ad Id
  static const String bannerId = "ca-app-pub-3940256099942544/6300978111";

  //! Admob Android Banner Ad Id2
  static const String bannerId2 = "ca-app-pub-3940256099942544/6300978111";

  //! Admob Android Interstitial Ad Id
  static const String interstitialId = "ca-app-pub-3940256099942544/1033173712";

  //! Admob Android Rewarded Video Ad Id
  static const String rewardedVideoId = "admob_android_rewarded_video_id";
}

class IOSAdUnits {
  IOSAdUnits._();

  //! Admob iOS App Id
  static const String appId = "admob_ios_app_id";

  //! Admob iOS Banner Ad Id
  static const String bannerId = "admob_ios_banner_id";

  //! Admob iOS Interstitial Ad Id
  static const String interstitialId = "admob_ios_interstitial_id";

  //! Admob iOS Rewarded Video Ad Id
  static const String rewardedVideoId = "admob_ios_rewarded_video_id";
}
