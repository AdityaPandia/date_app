// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/asset_strings.dart';
import '../../../../utils/constants.dart';


class NightLifeScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const NightLifeScreen({
    super.key, required this.onDataUpdated, required this.formKey, required this.onSkip, required this.onBack,

  });

  @override
  State<NightLifeScreen> createState() => _NightLifeScreenState();
}

class _NightLifeScreenState extends State<NightLifeScreen> {
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
                                child: SvgPicture.asset(AssetsStrings.nightlifeIcon),
                              ),
                            ),
                            const SizedBox(
                              height: 22.0,
                            ),
                            const Center(
                              child: Text(
                                "When it comes to nightlife",
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
                                  selectedString = "IM In Bed By Midnight";
                                });
                                widget.onDataUpdated("nightLife",selectedString);
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
                                      "i m in bed by midnight",
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
                                  isSelected = 1;
                                  selectedString = "I Party In Moderation";
                                });
                                widget.onDataUpdated("nightLife",selectedString);
                  
                              },
                              child: Container(
                                padding: const EdgeInsets.all(17.0),
                                decoration: BoxDecoration(
                                  color: isSelected == 1
                                      ? primaryColor
                                      : transparentColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                  border:
                                      Border.all(color: const Color(0XFFE8E6EA)),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "i party in moderation",
                                      style: TextStyle(
                                        color: isSelected == 1
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
                                  selectedString = "IM Night Owl";
                                });
                                widget.onDataUpdated("nightLife",selectedString);
                  
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
                                      "i m night owl",
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
