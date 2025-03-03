import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/constants.dart';

class RelationScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip; // Add onSkip callback
  final VoidCallback onBack; // Add onBack callback
  final VoidCallback onContinue; // Added to trigger parent page navigation

  const RelationScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey,
    required this.onSkip,
    required this.onBack,
    required this.onContinue, // Added onContinue callback
  });

  @override
  State<RelationScreen> createState() => _RelationScreenState();
}

class _RelationScreenState extends State<RelationScreen> {
  int isSelected = -1;
  late String selectedString = "";

  // List of options
  final List<Map<String, String>> options = [
    {"label": "A Relationship", "value": "A Relationship"},
    {"label": "Nothing Serious", "value": "Nothing Serious"},
    {"label": "I Know when I will find it", "value": "I Know when I will find it"},
  ];

  String? _errorMessage;

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
                                  child: SvgPicture.asset(AssetsStrings.lookingForIcon),
                                ),
                              ),
                              const SizedBox(height: 22.0),
                              const Center(
                                child: Text(
                                  "What are you looking for?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25.0),
                              ...options.map((option) {
                                int index = options.indexOf(option);
                                return buildOptionButton(
                                  index: index,
                                  label: option["label"]!,
                                  value: option["value"]!,
                                );
                              }).toList(),
                              const SizedBox(height: 10),
                              if (_errorMessage != null)
                                Text(
                                  _errorMessage!,
                                  style: const TextStyle(color: Colors.red, fontSize: 14),
                                ),

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
          _errorMessage = null; // Clear error message on selection
        });
        widget.onDataUpdated("lookingFor", selectedString); // Save data here
      },
      child: Container(
        padding: const EdgeInsets.all(17.0),
        margin: const EdgeInsets.only(bottom: 10),
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

  // Validation for continue button
  void _validateAndContinue() {
    print("inside validate and continue");
    if (selectedString.isEmpty) {
      setState(() {
        _errorMessage = "Please choose an option to continue.";
      });
    } else {
      widget.onContinue(); // Call the parent function to navigate to the next page
    }
  }
}







