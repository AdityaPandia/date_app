import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/asset_strings.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/constants.dart';

class HeightScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack;


  const HeightScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey, required this.onSkip, required this.onBack,
  });

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  double _value = 3.0;

  // Conversion helper methods
  double feetToInches(double feet) => feet * 12;
  double feetToCentimeters(double feet) => feet * 30.48;

  // Helper method for generating height display
  String formatHeight(double feet) {
    return "${feet.toStringAsFixed(2)} feet, ${feetToInches(feet).toStringAsFixed(2)}” (${feetToCentimeters(feet).toStringAsFixed(2)} cm)";
  }

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
                              _buildHeightIcon(),
                              const SizedBox(height: 22.0),
                              _buildHeightTitle(),
                              const SizedBox(height: 25.0),
                              _buildHeightDisplay(),
                              const SizedBox(height: 25.0),
                              _buildHeightSlider(),
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

  // Helper method to build the skip button
  Widget _buildSkipButton() {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Skip",
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }

  // Helper method to build the height icon
  Widget _buildHeightIcon() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: Color(0XFFf3f1fe),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          AssetsStrings.heightIcon,
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }

  // Helper method to build the height title
  Widget _buildHeightTitle() {
    return const Center(
      child: Text(
        "What is your height?",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
    );
  }

  // Helper method to build the height display text
  Widget _buildHeightDisplay() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        formatHeight(_value),
        style: const TextStyle(color: primaryColor),
      ),
    );
  }

  // Helper method to build the height slider
  Widget _buildHeightSlider() {
    return Slider(
      min: 3,
      max: 8,
      value: _value,
      activeColor: primaryColor,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
        widget.onDataUpdated("height", value.toString());  // Save data
      },
    );
  }
}
