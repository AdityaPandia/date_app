import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/asset_strings.dart';
import '../../../../utils/constants.dart';
import '../select_night_life/night_life_screen.dart';

class QualificationScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const QualificationScreen(
      {super.key, required this.onDataUpdated, required this.formKey, required this.onSkip, required this.onBack,});

  @override
  State<QualificationScreen> createState() => _QualificationScreenState();
}

class _QualificationScreenState extends State<QualificationScreen> {
  late String selectedString;
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: widget.formKey,
        child: Column(
          children: [
            buildHeader(onBack: widget.onBack),
            Expanded(
                child: SingleChildScrollView(
                  child: Container(
                                width: 100.0.w,
                                color: const Color(0XFFf3f1fe),
                                padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                                child: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Card(
                      color: whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(
                              height: 10.0,
                            ),
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(30.0),
                                decoration: const BoxDecoration(
                                    color: Color(0XFFf3f1fe),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(AssetsStrings.qualificationIcon),
                              ),
                            ),
                            const SizedBox(
                              height: 22.0,
                            ),
                            const Center(
                              child: Text(
                                "Your Qualification?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17.0),
                              ),
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 0;
                                  selectedString = "High school";
                                });
                                widget.onDataUpdated("qualifcation",selectedString);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(17.0),
                                decoration: BoxDecoration(
                                  color: isSelected == 0
                                      ? primaryColor
                                      : transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border:
                                      Border.all(color: const Color(0XFFE8E6EA)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "High school",
                                      style: TextStyle(
                                        color: isSelected == 0
                                            ? whiteColor
                                            : blackColor,
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 2;
                                  selectedString = "bachelors";
                                });
                                widget.onDataUpdated("qualifcation",selectedString);
                  
                              },
                              child: Container(
                                padding: const EdgeInsets.all(17.0),
                                decoration: BoxDecoration(
                                  color: isSelected == 2
                                      ? primaryColor
                                      : transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border:
                                      Border.all(color: const Color(0XFFE8E6EA)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "bachelors",
                                      style: TextStyle(
                                        color: isSelected == 2
                                            ? whiteColor
                                            : blackColor,
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 3;
                                  selectedString = "Mastersphom";
                                });
                                widget.onDataUpdated("qualifcation",selectedString);
                  
                              },
                              child: Container(
                                padding: const EdgeInsets.all(17.0),
                                decoration: BoxDecoration(
                                  color: isSelected == 3
                                      ? primaryColor
                                      : transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border:
                                      Border.all(color: const Color(0XFFE8E6EA)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Mastersphom",
                                      style: TextStyle(
                                        color: isSelected == 3
                                            ? whiteColor
                                            : blackColor,
                                        fontSize: 15.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                  ],
                                ),
                              ),
                ))
          ],
        ),
      ),
    );
  }
}
