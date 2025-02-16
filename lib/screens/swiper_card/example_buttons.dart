import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../drawer/flash_note_screen.dart';
import '../../utils/constants.dart';

//swipe card to the right side
Widget swipeRightButton(AppinioSwiperController controller) {
  // We can listen to the controller to get updated as the card shifts position!
  return ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final SwiperPosition? position = controller.position;
      final SwiperActivity? activity = controller.swipeActivity;
      // Lets measure the progress of the swipe iff it is a horizontal swipe.
      final double progress = (activity is Swipe || activity == null) &&
              position != null &&
              position.offset.toAxisDirection().isHorizontal
          ? position.progressRelativeToThreshold.clamp(-1, 1)
          : 0;
      // Lets animate the button according to the
      // progress. Here we'll color the button more grey as we swipe away from
      // it.
      final Color color = Color.lerp(
        primaryColor,
        CupertinoColors.systemGrey2,
        (-1 * progress).clamp(0, 1),
      )!;
      return GestureDetector(
        onTap: () => controller.swipeRight(),
        child: Transform.scale(
          scale: 1 + .1 * progress.clamp(0, 1),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.9),
                  spreadRadius: -10,
                  blurRadius: 20,
                  offset: const Offset(0, 20), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/like.svg",
              color: CupertinoColors.white,
              width: 30.0,
              height: 30.0,
            ),
          ),
        ),
      );
    },
  );
}

//swipe card to the left side
Widget swipeLeftButton(AppinioSwiperController controller) {
  return ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final SwiperPosition? position = controller.position;
      final SwiperActivity? activity = controller.swipeActivity;
      final double horizontalProgress =
          (activity is Swipe || activity == null) &&
                  position != null &&
                  position.offset.toAxisDirection().isHorizontal
              ? -1 * position.progressRelativeToThreshold.clamp(-1, 1)
              : 0;
      final Color color = Color.lerp(
        Colors.white,
        CupertinoColors.systemGrey2,
        (-1 * horizontalProgress).clamp(0, 1),
      )!;
      return GestureDetector(
        onTap: () => controller.swipeLeft(),
        child: Transform.scale(
          // Increase the button size as we swipe towards it.
          scale: 1 + .1 * horizontalProgress.clamp(0, 1),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.2),
                  spreadRadius: -10,
                  blurRadius: 20,
                  offset: const Offset(0, 20), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/close_icon.svg",
            ),
          ),
        ),
      );
    },
  );
}

Widget sendProfileButton(AppinioSwiperController controller) {
  return ListenableBuilder(
    listenable: controller,
    builder: (context, child) {
      final SwiperPosition? position = controller.position;
      final SwiperActivity? activity = controller.swipeActivity;
      final double horizontalProgress =
          (activity is Swipe || activity == null) &&
                  position != null &&
                  position.offset.toAxisDirection().isHorizontal
              ? -1 * position.progressRelativeToThreshold.clamp(-1, 1)
              : 0;
      final Color color = Color.lerp(
        Colors.white,
        CupertinoColors.systemGrey2,
        (-1 * horizontalProgress).clamp(0, 1),
      )!;
      return GestureDetector(
        onTap: () => controller.swipeLeft(),
        child: Transform.scale(
          // Increase the button size as we swipe towards it.
          scale: 1 + .1 * horizontalProgress.clamp(0, 1),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.2),
                  spreadRadius: -10,
                  blurRadius: 20,
                  offset: const Offset(0, 20), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/images/flash_message_icon.svg",
              width: 24.0,
              height: 24.0,
            ),
          ),
        ),
      );
    },
  );
}

//unswipe card
Widget unswipeButton(AppinioSwiperController controller, BuildContext context) {
  // final Color color = Color.lerp(
  //   Colors.white,
  //   CupertinoColors.systemGrey2,
  //   (-1 * horizontalProgress).clamp(0, 1),
  // )!;
  return GestureDetector(
    onTap: () {
      // controller.unswipe();
      pushScreen(context, screen: const FlashNoteScreen(),
      withNavBar: false);
    },
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black54.withOpacity(0.2),
            spreadRadius: -10,
            blurRadius: 20,
            offset: const Offset(0, 20), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,      child: SvgPicture.asset(
        "assets/images/thunder.svg",
      ),
    ),
  );
}

class TutorialAnimationButton extends StatelessWidget {
  const TutorialAnimationButton(this.onTap, {super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white, shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.2),
              spreadRadius: -10,
              blurRadius: 20,
              offset: const Offset(0, 20), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          "assets/images/refresh.svg",
        ),
      ),
    );
  }
}
