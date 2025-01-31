import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants.dart';
import '../../widgets/message_item.dart';
import '../chat_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf9f9fe),
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.5.w, right: 4.5.w, top: 2.0.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Activities",
                  style: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 4.5.w, top: 1.5.h),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/a1.png",
                        width: 70.0,
                        height: 70.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "You",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 16.0.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/a2.png",
                        width: 70.0,
                        height: 70.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Emma",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 16.0.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/a3.png",
                        width: 70.0,
                        height: 70.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Ava",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 16.0.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/a4.png",
                        width: 70.0,
                        height: 70.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Sophia",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 16.0.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/a5.png",
                        width: 70.0,
                        height: 70.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Amelia",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                            fontSize: 16.0.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.5.w, right: 4.5.w, top: 1.5.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Messages",
                  style: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  // isScrollControlled: true,
                  context: context,
                  enableDrag: true,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  showDragHandle: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return  ChatScreen();
                  },
                );
              },
              child: const MessageItem(
                assetString: "assets/images/a1.png",
                isUnRead: true,
                message: "Sticker 😍",
                name: "Emeile",
                time: "23 Min",
              ),
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a2.png",
              isUnRead: false,
              message: "Typing..",
              name: "Abigail",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a3.png",
              isUnRead: false,
              message: "Typing..",
              name: "Elizabeth",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a4.png",
              isUnRead: false,
              message: "Typing..",
              name: "Penelope",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a5.png",
              isUnRead: false,
              message: "Hello how are you?",
              name: "Chloe",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a5.png",
              isUnRead: true,
              message: "Typing..",
              name: "Grace",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a2.png",
              isUnRead: false,
              message: "Ok, see you then.",
              name: "Abigail",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
            const MessageItem(
              assetString: "assets/images/a5.png",
              isUnRead: false,
              message: "Typing..",
              name: "Abigail",
              time: "23 Min",
            ),
            const Divider(
              indent: 100.0,
              height: 10.0,
              endIndent: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
