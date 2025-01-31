import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        height: 90.0.h,
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
        child: Column(
          children: [
            SizedBox(
              height: 5.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/a1.png",
                    width: 65.0,
                    height: 65.0,
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emeile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Text(
                          "Online",
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: blackColor.withOpacity(0.1), width: 0.8),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                child: Row(
                  children: [
                    Expanded(child: const Divider()),
                    SizedBox(
                      width: 3.5.w,
                    ),
                    const Text("Today"),
                    SizedBox(
                      width: 3.5.w,
                    ),
                    const Expanded(child: Divider()),
                  ],
                )),
            SizedBox(
              height: 1.5.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                width: 70.0.w,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Color(0XFFf9f9fe),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                child: const Text(
                  "Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
                padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                child: const Align(
                    alignment: Alignment.centerLeft, child: Text("2:55 P.M."))),
            const SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                width: 70.0.w,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Color(0XFFF3F3F3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                child: const Text(
                  "Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
                padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                child: const Align(
                    alignment: Alignment.centerRight, child: Text("3:02 P.M."))),
            const SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                width: 40.0.w,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Color(0XFFf9f9fe),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                child: const Text(
                  "Sure, let’s do it! 😊",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
                padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                child: const Align(
                    alignment: Alignment.centerLeft, child: Text("3:10 P.M."))),
            const SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                width: 70.0.w,
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                    color: Color(0XFFF3F3F3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                child: const Text(
                  "Great I will write later the exact time and place. See you soon!",
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
                padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
                child: const Align(
                    alignment: Alignment.centerRight, child: Text("3:02 P.M."))),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: textInputDecoration3.copyWith(
                          hintText: "Enter Message",
                          fillColor: whiteColor,
                          filled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 13.0, bottom: 13.0)),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onEditingComplete: () {},
                      style: TextStyle(fontSize: 16.0.sp),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 4.5.w,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: blackColor.withOpacity(0.1), width: 0.8),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: SvgPicture.asset(
                      "assets/images/mic.svg",
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
