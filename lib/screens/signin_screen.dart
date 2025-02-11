import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';
import 'package:seting_app/utils/constants.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';
import 'package:seting_app/widgets/app_themed_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/login_model_response.dart';
import '../services/web_api.dart';
import '../utils/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  // Google Sign-In function
  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      // Check if the user is valid
      if (user == null) {
        return null;
      }

      // Save user data in SharedPreferences
      _saveUserData(user);

      return user;
    } catch (e) {
      print("Error during Google Sign-In: $e");
      return null;
    }
  }

  // Save user data locally in SharedPreferences
  Future<void> _saveUserData(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefsKeys.isLoggedIn, true);
    await prefs.setString(
        SharedPrefsKeys.userName, user.displayName ?? 'Unknown');
    await prefs.setString(SharedPrefsKeys.userEmail, user.email ?? 'Unknown');
    await prefs.setString(
        SharedPrefsKeys.userDisplayPhoto, user.photoURL ?? 'Unknown');
  }

  // Check if user exists in Firebase Authentication
  Future<bool> _isUserValid(String email) async {
    try {
      // Refresh the current user's ID token to ensure its validity
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        await firebaseUser
            .reload(); // Forces Firebase to refresh the user's information
        firebaseUser = FirebaseAuth.instance.currentUser; // Get updated user

        if (firebaseUser?.email == email) {
          print("EMAIL EXISTS");
          print("Hit login api");

          return true;
        }
      }

      print("EMAIL DOES NOT EXISTS");
      return false;
    } catch (e) {
      print("Error while checking user validity: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0.h,
              ),
              Image.asset(
                AssetsStrings.logo,
                width: 70.0.w,
              ),
              Text(
                "Seting",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Padding(
                padding:
                    EdgeInsets.only(left: 5.5.w, right: 5.5.w, bottom: 2.h),
                child: AppThemedButton(
                    withIcon: true,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      HapticFeedback.lightImpact();
                      EasyLoading.show();
                      User? user = await _signInWithGoogle();
                      EasyLoading.dismiss();

                      if (user != null) {
                        // Validate user existence on Firebase
                        bool isValidUser = await _isUserValid(user.email ?? '');
                        print("isValidUser::: ${isValidUser}");
                        if (isValidUser) {
                          // Call sign-in function
                          LoginModelResponse? loginResponse =
                              await WebConfig.signInWithEmail(
                            emailString: user.email ?? "",
                          );
                          if (loginResponse != null &&
                              loginResponse.success == true) {

                            await prefs.setString(
                              SharedPrefsKeys.userId,
                              loginResponse.data?.id ?? '',
                            );
                            // Navigate to the dashboard
                            if (context.mounted) {
                              Navigator.pushReplacementNamed(
                                  context, Routes.dashBoard);
                            }
                          } else if (loginResponse?.success == false) {
                            Navigator.pushReplacementNamed(
                                context, Routes.basicInfo);
                          }
                        } else {
                          // Navigate to BasicInfo if email is deleted
                          await FirebaseAuth.instance
                              .signOut(); // Sign out the invalid user
                          Navigator.pushReplacementNamed(
                              context, Routes.basicInfo);
                        }
                      } else {
                        // Sign-in failed; Navigate to BasicInfo
                        Navigator.pushReplacementNamed(
                            context, Routes.basicInfo);
                      }
                    },
                    icon: AssetsStrings.googleIcon,
                    label: "Sign In With Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
