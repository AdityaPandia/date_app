import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/models/all_users_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/web_api.dart';
import '../../utils/constants.dart';
import '../../utils/shared_pref/shared_pref_keys.dart';
import '../../widgets/drawer.dart';
import '../swiper_card/example_buttons.dart';
import '../swiper_card/example_candidate_model.dart';
import '../swiper_card/example_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String? accessToken;
  AllUsersResponse allUserData = AllUsersResponse();

  final AppinioSwiperController controller = AppinioSwiperController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // Delay the shake card animation until the widget is fully rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _shakeCard();
      }
    });
    getInitData();
  }

  getInitData() async {
    print("INSIDE getInitData all user ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      accessToken = prefs.getString(SharedPrefsKeys.accessToken);
    });
    await getAllUserData();
  }

  getAllUserData() async {
    print("Access Token: $accessToken");
    EasyLoading.show();
    AllUsersResponse? userModel = await WebConfig.getAllUsers(
      accessToken: accessToken ?? "",
    );
    EasyLoading.dismiss();

    if (userModel != null && userModel.success == true && userModel.data != null && userModel.data!.isNotEmpty) {
      setState(() {
        allUserData = userModel;
      });
      print("Length of all users list: ${allUserData.data?.length}");
    } else {
      print("Failed to get all user data or data is empty.");
      setState(() {
        allUserData = AllUsersResponse();  // Set a default empty value
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0XFFF3F3F3),
        drawer: const DrawerSideBar(),
        appBar: AppBar(
          backgroundColor: whiteColor,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              margin: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.all(5.0),
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.8),
                  borderRadius: BorderRadius.circular(8.0)),
              child: SvgPicture.asset(
                "assets/images/drawer.svg",
                width: 20.0,
                height: 20.0,
              ),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.all(5.0),
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.8),
                  borderRadius: BorderRadius.circular(8.0)),
              child: SvgPicture.asset("assets/images/notification.svg"),
            )
          ],
          title: Column(
            children: [
              Text(
                "Discover",
                style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              // Text(
              //   "Chicago, II",
              //   style: TextStyle(fontSize: 15.0.sp, color: blackColor),
              // ),
            ],
          ),
        ),
        body: CupertinoPageScaffold(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              allUserData.data == null || allUserData.data!.isEmpty
                  ? Center(child: Text("No users available."))
                  :   SizedBox(
                height: MediaQuery.of(context).size.height * .70,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 10,
                    bottom: 40,
                  ),
                  child: AppinioSwiper(
                    controller: controller,
                    invertAngleOnBottomDrag: true,

                    backgroundCardCount: allUserData.data?.length ?? 0,
                    swipeOptions: const SwipeOptions.all(),
                    onCardPositionChanged: (
                      SwiperPosition position,
                    ) {},
                    onSwipeEnd: _swipeEnd,
                    onEnd: _onEnd,
                    cardCount: allUserData.data?.length ?? 0,
                    cardBuilder: (BuildContext context, int index) {
                      //   return ExampleCard(availableMatch: allUserData.data?[index] );
                      return ExampleCard(
                        //  availableMatch: candidates[index],
                          allUserData: allUserData.data?[index]);
                    },
                  ),
                ),
              ),


              IconTheme.merge(
                data: const IconThemeData(size: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: TutorialAnimationButton(_shakeCard)),
                    const SizedBox(width: 20),
                    Flexible(child: swipeLeftButton(controller)),
                    const SizedBox(width: 20),
                    Flexible(child: swipeRightButton(controller)),
                    const SizedBox(width: 20),
                    Flexible(child: sendProfileButton(controller)),
                    const SizedBox(width: 20),
                    Flexible(child: unswipeButton(controller, context)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        log('A swipe was cancelled');
        break;
      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  void _onEnd() {
    log('end reached!');
  }
  void _shakeCard() async {
    const double distance = 30;
    await controller.animateTo(
      const Offset(-distance, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    await controller.animateTo(
      const Offset(distance, 0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    await controller.animateTo(
      const Offset(0, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }


// Animates the card back and forth to teach the user that it is swipable.
  // Future<void> _shakeCard() async {
  //   const double distance = 30;
  //   // We can animate back and forth by chaining different animations.
  //   await controller.animateTo(
  //     const Offset(-distance, 0),
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  //   await controller.animateTo(
  //     const Offset(distance, 0),
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  //   // We need to animate back to the center because `animateTo` does not center
  //   // the card for us.
  //   await controller.animateTo(
  //     const Offset(0, 0),
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  // }
}

// import 'dart:developer';
// import 'package:appinio_swiper/appinio_swiper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../models/all_users_response.dart';
// import '../../services/web_api.dart';
// import '../../utils/constants.dart';
// import '../../utils/shared_pref/shared_pref_keys.dart';
// import '../../widgets/drawer.dart';
// import '../swiper_card/example_buttons.dart';
// import '../swiper_card/example_card.dart';
//
// class DiscoverScreen extends StatefulWidget {
//   const DiscoverScreen({super.key});
//
//   @override
//   State<DiscoverScreen> createState() => _DiscoverScreenState();
// }
//
// class _DiscoverScreenState extends State<DiscoverScreen> {
//   String? accessToken;
//   List<AllUserData> userList = [];
//   final AppinioSwiperController controller = AppinioSwiperController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(milliseconds: 500)).then((_) {
//       if (mounted) {
//         _shakeCard();
//       }
//     });
//     getInitData();
//   }
//
//   getInitData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       accessToken = prefs.getString(SharedPrefsKeys.accessToken);
//     });
//     await getAllUserData();
//   }
//
//   getAllUserData() async {
//     EasyLoading.show();
//     AllUsersResponse? userModel = await WebConfig.getAllUsers(
//       accessToken: accessToken ?? "",
//     );
//     EasyLoading.dismiss();
//     if (userModel != null && userModel.success == true) {
//       setState(() {
//         userList = userModel.data ?? [];
//       });
//     } else {
//       print("Failed to get all user data.");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: const Color(0XFFF3F3F3),
//       drawer: const DrawerSideBar(),
//       appBar: AppBar(
//         backgroundColor: whiteColor,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             _scaffoldKey.currentState?.openDrawer();
//           },
//           child: Container(
//             margin: const EdgeInsets.all(10.0),
//             padding: const EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey, width: 0.8),
//                 borderRadius: BorderRadius.circular(8.0)),
//             child: SvgPicture.asset(
//               "assets/images/drawer.svg",
//             ),
//           ),
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(10.0),
//             padding: const EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey, width: 0.8),
//                 borderRadius: BorderRadius.circular(8.0)),
//             child: SvgPicture.asset("assets/images/notification.svg"),
//           )
//         ],
//         title: Column(
//           children: [
//             Text("Discover",
//                 style: TextStyle(
//                     fontSize: 20.0.sp, fontWeight: FontWeight.bold, color: primaryColor)),
//             Text("Chicago, II", style: TextStyle(fontSize: 15.0.sp, color: blackColor)),
//           ],
//         ),
//       ),
//       body: CupertinoPageScaffold(
//         child: Column(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: AppinioSwiper(
//                   controller: controller,
//                   backgroundCardCount: userList.length - 10,
//                   swipeOptions: const SwipeOptions.all(),
//                   onCardPositionChanged: (SwiperPosition position) {},
//                   onSwipeEnd: _swipeEnd,
//                   onEnd: _onEnd,
//                   cardCount: userList.length - 10,
//                   cardBuilder: (BuildContext context, int index) {
//                     return ExampleCard( availableMatch: userList[index],);
//                   },
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 swipeLeftButton(controller),
//                 const SizedBox(width: 20),
//                 swipeRightButton(controller),
//                 const SizedBox(width: 20),
//                 sendProfileButton(controller),
//                 const SizedBox(width: 20),
//                 unswipeButton(controller, context),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
//     switch (activity) {
//       case Swipe():
//         log('The card was swiped to the : ${activity.direction}');
//         log('previous index: $previousIndex, target index: $targetIndex');
//         break;
//       case Unswipe():
//         log('A ${activity.direction.name} swipe was undone.');
//         break;
//       case CancelSwipe():
//         log('A swipe was cancelled');
//         break;
//       case DrivenActivity():
//         log('Driven Activity');
//         break;
//     }
//   }
//
//   void _onEnd() {
//     log('End reached!');
//   }
//
//   Future<void> _shakeCard() async {
//     const double distance = 30;
//     await controller.animateTo(
//       const Offset(-distance, 0),
//       duration: const Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//     );
//     await controller.animateTo(
//       const Offset(distance, 0),
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeInOut,
//     );
//     await controller.animateTo(
//       const Offset(0, 0),
//       duration: const Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//     );
//   }
// }
