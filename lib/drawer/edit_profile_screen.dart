import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/controller/edit_profile_controller.dart';
import 'package:seting_app/utils/shared_pref/shared_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int index = 0;
  int isSelected = -1;
  final controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    controller.fetchProfile();
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
      body: Obx(
        () => controller.isLoading.value == 0
            ? Center(child: const CircularProgressIndicator())
            : controller.isLoading.value == 2
                ? Center(
                    child: Text("Error fetching profile"),
                  )
                : SingleChildScrollView(
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
                              margin:
                                  EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                              color: whiteColor,
                              surfaceTintColor: whiteColor,
                              child: SizedBox(
                                width: 100.0.w,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Full Name"),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      TextFormField(
                                        // controller:
                                        //     TextEditingController(text: "Rahul Kumar"),
                                        controller:
                                            controller.fullNameController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Full Name",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        // controller: TextEditingController(
                                        //     text: "rahulkuar123@gmail.com"),
                                        controller: controller.emailController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Email",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        // controller:
                                        //     TextEditingController(text: "987-654-3210"),
                                        controller: controller.phoneController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Phone Number",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        // controller:
                                        // TextEditingController(text: "Sv Public school"),
                                        controller: controller.schoolController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "School",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        // controller:
                                        //     TextEditingController(text: "10/02/1996"),
                                        controller:
                                            controller.birthDateController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Birthday",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        // controller: TextEditingController(text: "Male"),
                                        controller: controller.genderController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Gender",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        // controller:
                                        //     TextEditingController(text: "Ui/Ux Designer"),
                                        controller:
                                            controller.jobTitleController,
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Job Title",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        controller:
                                            controller.companyController,
                                        // controller: TextEditingController(
                                        //     text: "infosys solution Center"),
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Company",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                            controller.livingInController,
                                        // controller:
                                        //     TextEditingController(text: "jaipur Rajasthan"),
                                        decoration:
                                            textInputDecoration3.copyWith(
                                                hintText: "Living in",
                                                fillColor:
                                                    const Color(0XFFf7f6ff),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 18.0,
                                                        bottom: 18.0)),
                                        textInputAction: TextInputAction.next,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                              margin:
                                  EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                              color: whiteColor,
                              surfaceTintColor: whiteColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Interested",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color: transparentColor),
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
                              margin:
                                  EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                              color: whiteColor,
                              surfaceTintColor: whiteColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                    bottom: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Orientation",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color:
                                                      const Color(0XFFE8E6EA)),
                                            ),
                                            child: Text(
                                              controller
                                                  .fetchedProfileData
                                                  .value
                                                  .data!
                                                  .sexialorientation!,
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color: transparentColor),
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
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              border: Border.all(
                                                  color: transparentColor),
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
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            minWidth: 90.0.w,
                            height: 55.0,
                            color: primaryColor,
                            child: const Text(
                              "Apply",
                              style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                            onPressed: () async {
                              controller.validateEditProfileUpdate()
                                  ? await controller.patchProfile({
                                      "ageRange": controller.fetchedProfileData
                                          .value.data!.ageRange!,
                                      "hideBirthday": true,
                                      "hideLocation": false,
                                      "hideOnline": false,
                                      "name":
                                          controller.fullNameController.text,
                                      "email": controller.emailController.text,
                                      "phoneNumber":
                                  controller.phoneController.text,
                                      "school":
                                          controller.schoolController.text,
                                      "birthday":
                                          controller.birthDateController.text,
                                      "gender":
                                          controller.genderController.text,
                                      "jobTitle":
                                          controller.jobTitleController.text,
                                      "company":
                                          controller.companyController.text,
                                      "livingIn":
                                          controller.livingInController.text,
                                    })
                                  : Get.snackbar(
                                      "Please fill all the fields!", "");
                            }),
                        SizedBox(
                          height: 1.5.h,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
