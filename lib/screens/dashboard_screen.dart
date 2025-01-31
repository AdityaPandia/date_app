import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';
import '../widgets/drawer.dart';
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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //  getUserProfileData();
  }




  @override
  void didChangeDependencies() {
    if (_isInit) {}
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              textScaler: const TextScaler.linear(kTextScaleFactor),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            content: Text(
              'Do you want to exit an App',
              textScaler: const TextScaler.linear(kTextScaleFactor),
              style: TextStyle(fontSize: 16.0.sp),
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  textScaler: const TextScaler.linear(kTextScaleFactor),
                  style: TextStyle(fontSize: 14.0.sp),
                ),
              ),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text(
                  'Yes',
                  textScaler: TextScaler.linear(kTextScaleFactor),
                  style: TextStyle(fontSize: 14.0.sp),
                ),
              ),
            ],
          ),
        )) ??
        false;
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
              activeForegroundColor: primaryColor),
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
              activeForegroundColor: primaryColor),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        drawer: const DrawerSideBar(),
      body: PersistentTabView(
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
      ),
    );
  }
}
