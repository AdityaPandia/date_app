// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:seting_app/utils/asset_strings.dart';
// import 'package:seting_app/utils/routes.dart';
// import '../../../../utils/constants.dart';
//
// class LocationScreen extends StatefulWidget {
//   final Function(String, dynamic) onDataUpdated;
//   final GlobalKey<FormState> formKey;
//
//   const LocationScreen({
//     super.key,
//     required this.onDataUpdated,
//     required this.formKey,
//   });
//
//   @override
//   State<LocationScreen> createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   Position? _currentLocation;
//   late bool locationPermission = false;
//   late LocationPermission _permission;
//   String currentAddress = '';
//   Placemark? place;
//
//   Future<Position> getCurrentLocation() async {
//     locationPermission = await Geolocator.isLocationServiceEnabled();
//     if (!locationPermission) {
//       print("service disabled");
//     }
//     _permission = await Geolocator.checkPermission();
//     if (_permission == LocationPermission.denied) {
//       _permission = await Geolocator.requestPermission();
//     }
//     return await Geolocator.getCurrentPosition();
//   }
//
//   getUserLocation() async {
//
//     _currentLocation = await getCurrentLocation();
//     print("currentLocation: ${_currentLocation}");
//     EasyLoading.show();
//     await getAddressFromCoordinates();
//     EasyLoading.dismiss();
//     setState(() {});
//   }
//
//   getAddressFromCoordinates() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           _currentLocation!.latitude, _currentLocation!.longitude);
//       setState(() {
//         place = placemarks[0];
//         currentAddress =
//         "${place?.name}, ${place?.locality}, ${place?.administrativeArea}, ${place?.country}";
//       });
//     } catch (e) {
//       print("Error fetching address: $e");
//       setState(() {
//         currentAddress = "Unable to fetch address";
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: widget.formKey,
//         child: Column(
//           children: [
//             buildHeader(),
//             Expanded(
//                 child: Container(
//               width: 100.0.w,
//               color: const Color(0XFFf3f1fe),
//               padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                     GestureDetector(
//                       onTap: () {
//                         getUserLocation();
//                       },
//                       child: Card(
//                         color: whiteColor,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Flexible(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Text(
//                                         "My Location Is",
//                                         style: TextStyle(
//                                             color: blackColor,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16.0),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Text(
//                                       currentAddress.isNotEmpty
//                                           ? currentAddress
//                                           : "Tap to set location",
//                                       textAlign: TextAlign.center,
//                                       softWrap: true,
//                                       maxLines: 4,
//                                       style: const TextStyle(
//                                           color: Color(0XFF718190), fontSize: 15.0),
//                                     ),
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               DottedBorder(
//                                 borderType: BorderType.Oval,
//                                 dashPattern: const [3, 2],
//                                 radius: const Radius.circular(12),
//                                 strokeWidth: 1.8,
//                                 color: primaryColor,
//                                 child: Container(
//                                   padding: const EdgeInsets.all(14.0),
//                                   decoration: const BoxDecoration(
//                                       color: Color(0XFFf3f1fe), shape: BoxShape.circle),
//                                   child: SvgPicture.asset(AssetsStrings.locationIcon),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   const Spacer(),
//                   // MaterialButton(
//                   //   minWidth: 90.0.w,
//                   //   height: 55.0,
//                   //   shape: RoundedRectangleBorder(
//                   //       borderRadius: BorderRadius.circular(14.0)),
//                   //   onPressed: () async {
//                   //     nextScreenReplace(context, const SplashScreen());
//                   //
//                   //     // var getData = await WebConfig.createUser(
//                   //     //     nameString: widget.name,
//                   //     //     gender: widget.selectedGender,
//                   //     //     birthDate: widget.birthDate,
//                   //     //     school: widget.schoolName,
//                   //     //     showMe: widget.showMe,
//                   //     //     interests: widget.addedInterests,
//                   //     //     images: widget.selectedPhotos,
//                   //     //     smoking: widget.smoke,
//                   //     //     emailAddress: widget.emailAddress,
//                   //     //     sexualOrientation:
//                   //     //         widget.mySexualOrientation.toUpperCase(),
//                   //     //     lookingFor: widget.lookingFor,
//                   //     //     excercies: widget.excercise,
//                   //     //     height: widget.height,
//                   //     //     idealVacation: widget.vacation,
//                   //     //     eatingHabbit: widget.eatingHabbit,
//                   //     //     communicationStyle: widget.communctionStyle,
//                   //     //     oftenDrink: widget.oftenDrink,
//                   //     //     aboutKids: widget.kids,
//                   //     //     zodiacSign: widget.zodiac,
//                   //     //     qualification: widget.qualification,
//                   //     //     nightLife: widget.nightLife,
//                   //     //     cookingSkill: widget.cookingSkill);
//                   //
//                   //     // if (getData["success"] == true) {
//                   //     //   await EasyLoading.showSuccess(
//                   //     //       "Your Account Created Successfully");
//                   //     //   nextScreenReplace(context, const SplashScreen());
//                   //     // } else {
//                   //     //   await EasyLoading.showError(getData["error"]);
//                   //     // }
//                   //   },
//                   //   color: primaryColor,
//                   //   child: const Text(
//                   //     AppStrings.continueButton,
//                   //     style: TextStyle(
//                   //         fontSize: 16.0,
//                   //         color: whiteColor,
//                   //         fontWeight: FontWeight.bold),
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 2.5.h,
//                   // ),
//                   DottedBorder(
//                     borderType: BorderType.RRect,
//                     dashPattern: const [3, 2],
//                     radius: const Radius.circular(12),
//                     strokeWidth: 1.8,
//                     color: primaryColor,
//                     child: MaterialButton(
//                       minWidth: 88.0.w,
//                       height: 55.0,
//                       elevation: 0.0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(14.0)),
//                       onPressed: () {
//                         Navigator.pushNamed(context, Routes.basicInfo);
//                         //Navigator.pop(context);
//                       },
//                       color: const Color(0XFFf3f1fe),
//                       child: const Text(
//                         "Back",
//                         style: TextStyle(
//                             fontSize: 16.0,
//                             color: primaryColor,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';
import 'package:seting_app/utils/routes.dart';
import '../../../../utils/constants.dart';

class LocationScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onBack;

  const LocationScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey, required this.onBack,
  });

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentLocation;
  bool locationSelected = false;
  late bool locationPermission = false;
  late LocationPermission _permission;
  String currentAddress = '';
  Placemark? place;

  Future<Position> getCurrentLocation() async {
    locationPermission = await Geolocator.isLocationServiceEnabled();
    if (!locationPermission) {
      print("Service disabled");
    }
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  getUserLocation() async {
    _currentLocation = await getCurrentLocation();
    print("currentLocation: $_currentLocation");
    EasyLoading.show();
    await getAddressFromCoordinates();
    EasyLoading.dismiss();

    // Save lat and lon using widget.onDataUpdated
    if (_currentLocation != null) {
      widget.onDataUpdated('lat', _currentLocation!.latitude);
      widget.onDataUpdated('long', _currentLocation!.longitude);
      locationSelected = true; // Mark location as selected
    }
    setState(() {});
  }

  getAddressFromCoordinates() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);
      setState(() {
        place = placemarks[0];
        currentAddress =
        "${place?.name}, ${place?.locality}, ${place?.administrativeArea}, ${place?.country}";
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
    return Scaffold(
      body: Form(
        key: widget.formKey,
        child: Stack(
          children: [
            Column(
              children: [
                buildHeader(onBack: widget.onBack),
                Container(
                  width: 100.0.w,
                  color: const Color(0XFFf3f1fe),
                  padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w, top: 1.h),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getUserLocation();
                        },
                        child: Card(
                          color: whiteColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Text(
                                        currentAddress.isNotEmpty
                                            ? currentAddress
                                            : "Tap to set location",
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        maxLines: 4,
                                        style: const TextStyle(
                                            color: Color(0XFF718190),
                                            fontSize: 15.0),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 1.0, // Distance from the bottom
              left: 16.0,   // Distance from the left
              right: 16.0,  // Distance from the right
              child: DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [3, 2],
                radius: const Radius.circular(12),
                strokeWidth: 1.8,
                color: primaryColor,
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 55.0,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0)),
                  onPressed: widget.onBack,
                  color: const Color(0XFFf3f1fe),
                  child: const Text(
                    "Back",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}
