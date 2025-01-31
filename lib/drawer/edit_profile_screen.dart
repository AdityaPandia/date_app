import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int index = 0;
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f1fe),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: whiteColor),
        title: Text(
          "Edit Profile",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 45.0),
                  color: primaryColor,
                  width: 100.0.w,
                  height: 70.0,
                ),
                Image.asset(
                  "assets/images/a1.png",
                  width: 100.0,
                  height: 100.0,
                ),
              ],
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Column(
              children: [
                Card(
                  margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  color: whiteColor,
                  surfaceTintColor: whiteColor,
                  child: SizedBox(
                    width: 100.0.w,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Full Name"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: "Rahul Kumar"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Full Name",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Email"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: TextEditingController(
                                text: "rahulkuar123@gmail.com"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Email",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Phone Number"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: "987-654-3210"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Phone Number",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("School"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: "Sv Public school"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "School",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Birthday"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: "10/02/1996"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Birthday",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Gender"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: TextEditingController(text: "Male"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Gender",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Job Title"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: "Ui/Ux Designer"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Job Title",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Company"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: TextEditingController(
                                text: "infosys solution Center"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Company",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 2.0.h,
                          ),
                          const Text("Living in"),
                          const SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller:
                                TextEditingController(text: "jaipur Rajasthan"),
                            decoration: textInputDecoration3.copyWith(
                                hintText: "Living in",
                                fillColor: const Color(0XFFf7f6ff),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 20.0, top: 18.0, bottom: 18.0)),
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
                          SizedBox(
                            height: 1.5..h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Card(
                  margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  color: whiteColor,
                  surfaceTintColor: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Interested",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: const Color(0XFFE8E6EA)),
                                ),
                                child: const Text(
                                  "Pets",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.5.w,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: const Color(0XFFE8E6EA)),
                                ),
                                child: const Text(
                                  "Cooking",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.5.w,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: const Color(0XFFE8E6EA)),
                                ),
                                child: const Text(
                                  "Technology",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: const Color(0XFFE8E6EA)),
                                ),
                                child: const Text(
                                  "Art",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.5.w,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: const Color(0XFFE8E6EA)),
                                ),
                                child: const Text(
                                  "Science",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.5.w,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(color: transparentColor),
                                ),
                                child: const Text(
                                  "Science",
                                  style: TextStyle(
                                    color: transparentColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Card(
                  margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  color: whiteColor,
                  surfaceTintColor: whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Orientation",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                      color: const Color(0XFFE8E6EA)),
                                ),
                                child: const Text(
                                  "Straight",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.5.w,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(color: transparentColor),
                                ),
                                child: const Text(
                                  "Cooking",
                                  style: TextStyle(
                                    color: transparentColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3.5.w,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(color: transparentColor),
                                ),
                                child: const Text(
                                  "Technology",
                                  style: TextStyle(
                                    color: transparentColor,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
