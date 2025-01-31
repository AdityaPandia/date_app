import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';

import '../../../../utils/all_strings.dart';
import '../../../../utils/constants.dart';

class ExcerciseScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack; // Add onSkip callback

  const ExcerciseScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey, required this.onSkip, required this.onBack,
  });

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  int isSelected = -1;
  late String selectedString;

  // Define the list of options
  final List<Map<String, String>> exerciseOptions = [
    {"label": "Occasional", "value": "Occasional"},
    {"label": "Enough cardio to keep up", "value": "Enough cardio to keep up"},
    {"label": "All exercise all the time", "value": "All exercise all the time"},
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
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10.0),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    color: Color(0XFFf3f1fe),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(AssetsStrings.exerciseIcon),
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              const Center(
                                child: Text(
                                  "What are you exercise Habits",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              // Dynamically build exercise options
                              ...exerciseOptions.map((option) {
                                int index = exerciseOptions.indexOf(option);
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
  Widget buildOptionButton({required int index, required String label, required String value}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
          selectedString = value;
        });
        widget.onDataUpdated("exercise", selectedString); // Save data here
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
