import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class FlashNoteScreen extends StatefulWidget {
  const FlashNoteScreen({super.key});

  @override
  State<FlashNoteScreen> createState() => _FlashNoteScreenState();
}

class _FlashNoteScreenState extends State<FlashNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f1fe),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 14.0.h,
              width: 100.0.w,
              padding: EdgeInsets.only(left: 4.5.w, right: 4.5.w,bottom: 1.0.h),
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(color: whiteColor),
              child: Text(
                "Get Deep When You Add A Message To You Flash Note",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0.sp),
              ),
            ),
            SizedBox(height: 2.5.h,),
            Padding(
              padding: EdgeInsets.only(left:5.5.w,right: 5.5.w),
              child: Column(
                children: [
                  Image.asset("assets/images/flash_message_sample.png"),
                  SizedBox(
                    height: 2.5.h,
                  ),
                   TextFormField(

                    decoration: textInputDecoration3.copyWith(
                        hintText: "Enter Message",
                        fillColor: whiteColor,
                        filled: true,
                        contentPadding: const EdgeInsets.only(
                            left: 20.0, top: 18.0, bottom: 18.0)),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 4,
                    maxLength: 500,
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
                  SizedBox(
                    height: 1.0.h,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minWidth: 90.0.w,
                      height: 55.0,
                      color: primaryColor,
                      child: const Text(
                        "Send",
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                      onPressed: () {}),
                  SizedBox(
                    height: 1.0.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
