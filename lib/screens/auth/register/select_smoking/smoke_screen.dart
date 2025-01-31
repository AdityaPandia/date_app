import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';

import '../../../../utils/all_strings.dart';
import '../../../../utils/constants.dart';

class SmokeScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack;


  const SmokeScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey, required this.onSkip, required this.onBack,
  });

  @override
  State<SmokeScreen> createState() => _SmokeScreenState();
}

class _SmokeScreenState extends State<SmokeScreen> {
  late String selectedString;
  int isSelected = -1;

  // Define the list of smoking options
  final List<Map<String, String>> smokeOptions = [
    {"label": "Well o smoke", "value": "Well o smoke"},
    {"label": "Not a fun but whatever", "value": "Not a fun but whatever"},
    {"label": "Zero Tolerance", "value": "Zero Tolerance"},
  ];

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
                  padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                  child: Column(
                    children: [
                      const SizedBox(height: 8.0),
                      Card(
                        color: whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const SizedBox(height: 10.0),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(30.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0XFFf3f1fe),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(AssetsStrings.smokeIcon),
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              const Center(
                                child: Text(
                                  "Your opinion on smoking",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              // Dynamically build smoking options
                              ...smokeOptions.map((option) {
                                int index = smokeOptions.indexOf(option);
                                return buildOptionButton(
                                  index: index,
                                  label: option["label"]!,
                                  value: option["value"]!,
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Build individual option button
  Widget buildOptionButton({
    required int index,
    required String label,
    required String value,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
          selectedString = value;
        });
        widget.onDataUpdated("smoking", selectedString); // Save data here
      },
      child: Container(
        padding: const EdgeInsets.all(17.0),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isSelected == index ? primaryColor : transparentColor,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(color: const Color(0XFFE8E6EA)),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected == index ? whiteColor : blackColor,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
