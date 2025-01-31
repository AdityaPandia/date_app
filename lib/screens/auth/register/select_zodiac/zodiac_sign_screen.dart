import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/asset_strings.dart';
import '../../../../utils/constants.dart';

class ZodiacSignScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack;


  const ZodiacSignScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey, required this.onSkip, required this.onBack,
  });

  @override
  State<ZodiacSignScreen> createState() => _ZodiacSignScreenState();
}

class _ZodiacSignScreenState extends State<ZodiacSignScreen> {
  late String selectedString;
  int isSelected = -1;

  final List<Map<String, String>> zodiacSigns = [




    {"name": "Aries", "value": "Aries"},
    {"name": "Taurus", "value": "Taurus"},
    {"name": "Gemini", "value": "Gemini"},
    {"name": "Cancer", "value": "Cancer"},
    {"name": "Leo", "value": "Leo"},
    {"name": "Virgo", "value": "Virgo"},
    {"name": "Libra", "value": "Libra"},
    {"name": "Scorpio", "value": "Scorpio"},
    {"name": "Sagittarius", "value": "Sagittarius"},

    {"name": "Capricorn", "value": "Capricorn"},
    {"name": "Aquarius", "value": "Aquarius"},
    {"name": "Pisces", "value": "Pisces"},

    // You can add more zodiac signs here
  ];

  // Reusable method to build each zodiac option
  Widget buildZodiacOption(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
          selectedString = zodiacSigns[index]['value']!;
        });
        widget.onDataUpdated("zodiacSign", selectedString);
      },
      child: Container(
        padding: const EdgeInsets.all(17.0),
        decoration: BoxDecoration(
          color: isSelected == index ? primaryColor : transparentColor,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(color: const Color(0XFFE8E6EA)),
        ),
        child: Row(
          children: [
            Text(
              zodiacSigns[index]['name']!,
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
                              _buildZodiacIcon(),
                              const SizedBox(height: 22.0),
                              _buildTitle(),
                              const SizedBox(height: 25.0),
                              ...List.generate(zodiacSigns.length, (index) {
                                return Column(
                                  children: [
                                    buildZodiacOption(index),
                                    const SizedBox(height: 10.0),
                                  ],
                                );
                              }),
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

  // Helper method to build the zodiac icon
  Widget _buildZodiacIcon() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          color: Color(0XFFf3f1fe),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AssetsStrings.zodiacIcon),
      ),
    );
  }

  // Helper method to build the title text
  Widget _buildTitle() {
    return const Center(
      child: Text(
        "Your zodiac Sign?",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
    );
  }
}
