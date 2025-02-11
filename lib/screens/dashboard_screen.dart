import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/screens/splash/splash_screen.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seting_app/screens/signin_screen.dart';
import 'package:seting_app/widgets/drawer.dart';
import '../utils/constants.dart';
import 'dashboard/discover_screen.dart';
import 'dashboard/feed_screen.dart';
import 'dashboard/interactions_screen.dart';
import 'dashboard/matches_screen.dart';
import 'dashboard/messages_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;
  int index = 0;
  bool? userLoggedIn;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool(SharedPrefsKeys.isLoggedIn) ?? false;
    if (!loggedIn) {
      // If the user is logged out, navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen()),
      );
    }
    setState(() {
      userLoggedIn = loggedIn; // Update state
    });
  }

  @override
  Widget build(BuildContext context) {
    // If not logged in, show the SignInScreen
    if (userLoggedIn == false) {
      return const SignInScreen();
    }

    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerSideBar(),
      body: SafeArea(
        child: (userLoggedIn ?? false)
            ? PersistentTabView(
          stateManagement: false,
          onTabChanged: (value) {
            setState(() {
              index = value;
            });
          },
          tabs: _tabs(),
          navBarBuilder: (navBarConfig) {
            return Style4BottomNavBar(navBarConfig: navBarConfig);
          },
        )
            : Container(),
      ),
    );
  }

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: DiscoverScreen(),
      item: ItemConfig(
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            index == 0
                ? "assets/images/discover.svg"
                : "assets/images/cards_inactive.svg",
            width: 18.0,
            height: 18.0,
          ),
        ),
        activeColorSecondary: primaryColor,
        inactiveForegroundColor: primaryColor,
        activeForegroundColor: primaryColor,
      ),
    ),
    PersistentTabConfig(
      screen: const FeedScreen(),
      item: ItemConfig(
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            index == 1
                ? "assets/images/feed_active.svg"
                : "assets/images/feeds.svg",
            width: 18.0,
            height: 18.0,
          ),
        ),
        activeColorSecondary: primaryColor,
        inactiveForegroundColor: primaryColor,
        activeForegroundColor: primaryColor,
      ),
    ),
    PersistentTabConfig(
      screen: const MatchesScreen(),
      item: ItemConfig(
        activeColorSecondary: primaryColor,
        inactiveForegroundColor: primaryColor,
        activeForegroundColor: primaryColor,
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            index == 2
                ? "assets/images/matches_active.svg"
                : "assets/images/matches.svg",
            width: 18.0,
            height: 18.0,
          ),
        ),
      ),
    ),
    PersistentTabConfig(
      screen: const MessageScreen(),
      item: ItemConfig(
        activeColorSecondary: primaryColor,
        inactiveForegroundColor: primaryColor,
        activeForegroundColor: primaryColor,
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            index == 3
                ? "assets/images/message_active.svg"
                : "assets/images/message.svg",
            width: 18.0,
            height: 18.0,
          ),
        ),
      ),
    ),
    PersistentTabConfig(
      screen: const InteractionScreen(),
      item: ItemConfig(
        activeColorSecondary: primaryColor,
        inactiveForegroundColor: primaryColor,
        activeForegroundColor: primaryColor,
        icon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SvgPicture.asset(
            index == 4
                ? "assets/images/interaction_active.svg"
                : "assets/images/interaction.svg",
            width: 18.0,
            height: 18.0,
          ),
        ),
      ),
    ),
  ];
}
