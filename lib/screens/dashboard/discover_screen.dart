// import 'dart:developer';
// import 'package:appinio_swiper/appinio_swiper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:seting_app/models/all_users_response.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../services/web_api.dart';
// import '../../utils/constants.dart';
// import '../../utils/shared_pref/shared_pref_keys.dart';
// import '../../widgets/drawer.dart';
// import '../swiper_card/example_buttons.dart';
// import '../swiper_card/example_candidate_model.dart';
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
//   AllUsersResponse allUserData = AllUsersResponse();
//   // Stack to store swiped users
//   List<AllUserData> swipedUsersStack = [];
//
//   final AppinioSwiperController controller = AppinioSwiperController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Delay the shake card animation until the widget is fully rendered
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (mounted) {
//         _shakeCard();
//       }
//     });
//     getInitData();
//   }
//
//   getInitData() async {
//     print("INSIDE getInitData all user ");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       accessToken = prefs.getString(SharedPrefsKeys.accessToken);
//     });
//     await getAllUserData();
//   }
//
//   getAllUserData() async {
//     print("Access Token hhgh: $accessToken");
//     EasyLoading.show();
//     AllUsersResponse? userModel = await WebConfig.getAllUsers(
//       accessToken: accessToken ?? "",
//     );
//     EasyLoading.dismiss();
//
//     if (userModel != null &&
//         userModel.success == true &&
//         userModel.data != null &&
//         userModel.data!.isNotEmpty) {
//       setState(() {
//         allUserData = userModel;
//       });
//       print("Length of all users list: ${allUserData.data?.length}");
//     } else {
//       print("Failed to get all user data or data is empty.");
//       setState(() {
//         allUserData = AllUsersResponse(); // Set a default empty value
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         key: _scaffoldKey,
//         backgroundColor: const Color(0XFFF3F3F3),
//         drawer: const DrawerSideBar(),
//         appBar: AppBar(
//           backgroundColor: whiteColor,
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () {
//               _scaffoldKey.currentState?.openDrawer();
//             },
//             child: Container(
//               margin: const EdgeInsets.all(12.0),
//               padding: const EdgeInsets.all(5.0),
//               width: 30.0,
//               height: 30.0,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 0.8),
//                   borderRadius: BorderRadius.circular(8.0)),
//               child: SvgPicture.asset(
//                 "assets/images/drawer.svg",
//                 width: 20.0,
//                 height: 20.0,
//               ),
//             ),
//           ),
//           actions: [
//             Container(
//               margin: const EdgeInsets.all(12.0),
//               padding: const EdgeInsets.all(5.0),
//               width: 40.0,
//               height: 40.0,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 0.8),
//                   borderRadius: BorderRadius.circular(8.0)),
//               child: SvgPicture.asset("assets/images/notification.svg"),
//             )
//           ],
//           title: Column(
//             children: [
//               Text(
//                 "Discover",
//                 style: TextStyle(
//                     fontSize: 20.0.sp,
//                     fontWeight: FontWeight.bold,
//                     color: primaryColor),
//               ),
//               // Text(
//               //   "Chicago, II",
//               //   style: TextStyle(fontSize: 15.0.sp, color: blackColor),
//               // ),
//             ],
//           ),
//         ),
//         body: CupertinoPageScaffold(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: MediaQuery.of(context).size.height*0.01,),
//               allUserData.data == null || allUserData.data!.isEmpty
//                   ? Center(child: Text("No users available nearby"))
//                   : Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     left: 25,
//                     right: 25,
//                    // top: 10,
//                     bottom: 40,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 30), // Push the whole stack down
//                     child: AppinioSwiper(
//                       controller: controller,
//                       backgroundCardCount: 1,
//                       backgroundCardOffset: Offset(0, -MediaQuery.of(context).size.height * 0.05),
//                       swipeOptions: const SwipeOptions.only(
//                         left: true,
//                         right: true,
//                         up: false,
//                         down: false,
//                       ),
//                       onSwipeEnd: _swipeEnd,
//                       onEnd: _onEnd,
//                       cardCount: allUserData.data?.length ?? 0,
//                       cardBuilder: (BuildContext context, int index) {
//                         return ExampleCard(
//                           allUserData: allUserData.data?[index],
//                           isActive: index == 0, // ✅ Set `isActive` true only for the top card
//                         );
//                       },
//                     ),
//
//
//
//                   )
//                 ),
//               ),
//               allUserData.data == null || allUserData.data!.isEmpty
//                   ? Container()
//                   : Padding(
//                 padding: const EdgeInsets.only(left:10.0,right: 10),
//                 child: IconTheme.merge(
//                   data: const IconThemeData(size: 30),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Flexible(child: TutorialAnimationButton(rewind)),
//                       const SizedBox(width: 20),
//                       Flexible(child: swipeLeftButton(controller)),
//                       const SizedBox(width: 20),
//                       Flexible(child: swipeRightButton(controller)),
//                       const SizedBox(width: 20),
//                       Flexible(child: sendProfileButton(controller)),
//                       const SizedBox(width: 20),
//                       Flexible(child: unswipeButton(controller, context)),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
//     if (previousIndex < 0 || previousIndex >= (allUserData.data?.length ?? 0)) {
//       return; // Prevent out-of-bounds errors
//     }
//
//     String? userId = allUserData.data?[previousIndex].id; // Extract user ID
//
//     switch (activity) {
//       case Swipe():
//         log('The card was swiped to the : ${activity.direction}');
//         log('Previous index: $previousIndex, Target index: $targetIndex');
//         log('User ID: $userId');
//
//         // ✅ Store swiped user in stack before API call
//         swipedUsersStack.add(allUserData.data![previousIndex]);
//
//         if (activity.direction == AxisDirection.right) {
//           print("Liked User ID: $userId");
//           hitLikeApi(userId: userId);
//         } else if (activity.direction == AxisDirection.left) {
//           print("Disliked User ID: $userId");
//           hitDislikeApi(userId: userId);
//         }
//         break;
//
//       case Unswipe():
//         log('A ${activity.direction.name} swipe was undone.');
//         log('Previous index: $previousIndex, Target index: $targetIndex');
//         break;
//
//       case CancelSwipe():
//         log('A swipe was cancelled');
//         break;
//
//       case DrivenActivity():
//         log('Driven Activity');
//         break;
//     }
//   }
//
//   void rewind() {
//     print("rewind tapped");
//     if (swipedUsersStack.isEmpty) {
//       print("No users to rewind.");
//       return;
//     }
//
//     // Get last swiped user
//     AllUserData lastUser = swipedUsersStack.removeLast();
//
//     // Add them back to the top of the stack
//     setState(() {
//       allUserData.data!.insert(0, lastUser);
//     });
//
//     // Unswipe the last card (bring it back)
//     controller.unswipe();
//   }
//
//
//   hitLikeApi({required String? userId}) async {
//     if (userId == null) return;
//     print("Liked user with ID: $userId");
//
//   var response =   await WebConfig.likeProfile(likedUserID: userId);
//
//
//   }
//   void _onEnd() {
//     log('end reached!');
//   }
//
//   hitDislikeApi({required String? userId}) async {
//     if (userId == null) return;
//     print("Disliked user with ID: $userId");
//
//     var response =   await WebConfig.disLikedProfile(likedUserID: userId);
//
//   }
//
//
//   void _shakeCard() async {
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
//
// }
//
//
import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/models/all_users_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_cards/swipe_cards.dart';
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
  // Stack to store swiped users
  List<AllUserData> swipedUsersStack = [];
  late  MatchEngine _matchEngine ;
  final List<SwipeItem> _swipeItems = [];

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
    final List<Map<String, String>> dummyUsers = [
      {"name": "Alice", "image": "https://randomuser.me/api/portraits/women/1.jpg"},
      {"name": "Bob", "image": "https://randomuser.me/api/portraits/men/2.jpg"},
      {"name": "Charlie", "image": "https://randomuser.me/api/portraits/men/3.jpg"},
      {"name": "Diana", "image": "https://randomuser.me/api/portraits/women/4.jpg"},
    ];

    // Populate swipe items
    for (var user in dummyUsers) {
      _swipeItems.add(
        SwipeItem(
          content: user,
          likeAction: () => log("${user['name']} Liked"),
          nopeAction: () => log("${user['name']} Disliked"),
          superlikeAction: () => log("${user['name']} Superliked"),
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
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
    print("Fetching all user data...");
    EasyLoading.show();

    AllUsersResponse? userModel = await WebConfig.getAllUsers(
      accessToken: accessToken ?? "",
    );

    EasyLoading.dismiss();

    if (userModel != null &&
        userModel.success == true &&
        userModel.data != null &&
        userModel.data!.isNotEmpty) {
      setState(() {
        allUserData = userModel;
        _swipeItems.clear(); // Clear old swipe items

        for (var user in allUserData.data!) {
          _swipeItems.add(
            SwipeItem(
              content: user,
              likeAction: () => log("${user.name} Liked"),
              nopeAction: () => log("${user.name} Disliked"),
              superlikeAction: () => log("${user.name} Superliked"),
            ),
          );
        }

        // Reinitialize MatchEngine with updated data
        _matchEngine = MatchEngine(swipeItems: _swipeItems);
      });

      print("Loaded ${allUserData.data?.length} users from API.");
    } else {
      print("Failed to get all user data or data is empty.");
      setState(() {
        allUserData = AllUsersResponse(); // Reset data
        _swipeItems.clear();
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
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            allUserData.data == null || allUserData.data!.isEmpty
                ? Center(child: Text("No users available nearby"))
                : Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // ✅ Swiper Stack
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, bottom: 80),
                    child: AppinioSwiper(
                      controller: controller,
                      backgroundCardCount: 1,
                      backgroundCardOffset: Offset(0, -MediaQuery.of(context).size.height * 0.05),
                      swipeOptions: const SwipeOptions.all(),
                      onSwipeEnd: _swipeEnd,
                      onEnd: _onEnd,
                      cardCount: allUserData.data?.length ?? 0,
                      cardBuilder: (BuildContext context, int index) {
                        return ExampleCard(
                          allUserData: allUserData.data?[index],
                          isActive: index == 0,
                        );
                      },
                    ),
                  ),

                  // ✅ Correct Button Positioning - Half Over Image, Half Over Background
                  if (allUserData.data != null && allUserData.data!.isNotEmpty)
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.03, // Dynamic bottom spacing
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(

                          child: IconTheme.merge(
                            data: const IconThemeData(size: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(child: TutorialAnimationButton(rewind)),
                                Flexible(child: swipeLeftButton(controller)),
                                Flexible(child: swipeRightButton(controller)),
                                Flexible(child: sendProfileButton(controller)),
                                Flexible(child: unswipeButton(controller, context)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );




  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    if (previousIndex < 0 || previousIndex >= (allUserData.data?.length ?? 0)) {
      return; // Prevent out-of-bounds errors
    }

    String? userId = allUserData.data?[previousIndex].id; // Extract user ID

    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('Previous index: $previousIndex, Target index: $targetIndex');
        log('User ID: $userId');

        // ✅ Store swiped user in stack before API call
        swipedUsersStack.add(allUserData.data![previousIndex]);

        if (activity.direction == AxisDirection.right) {
          print("Liked User ID: $userId");
          hitLikeApi(userId: userId);
        } else if (activity.direction == AxisDirection.left) {
          print("Disliked User ID: $userId");
          hitDislikeApi(userId: userId);
        }
        break;

      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('Previous index: $previousIndex, Target index: $targetIndex');
        break;

      case CancelSwipe():
        log('A swipe was cancelled');
        break;

      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  void rewind() {
    print("rewind tapped");
    if (swipedUsersStack.isEmpty) {
      _shakeCard();
      print("No users to rewind.");
      return;
    }

    // Get last swiped user
    AllUserData lastUser = swipedUsersStack.removeLast();

    // Add them back to the top of the stack
    setState(() {
      allUserData.data!.insert(0, lastUser);
    });

    // Unswipe the last card (bring it back)
    controller.unswipe();
  }


  hitLikeApi({required String? userId}) async {
    if (userId == null) return;
    print("Liked user with ID: $userId");

    var response =   await WebConfig.likeProfile(likedUserID: userId);


  }
  void _onEnd() {
    log('end reached!');
  }

  hitDislikeApi({required String? userId}) async {
    if (userId == null) return;
    print("Disliked user with ID: $userId");

    var response =   await WebConfig.disLikedProfile(likedUserID: userId);

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

}


