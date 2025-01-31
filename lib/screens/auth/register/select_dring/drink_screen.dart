import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/asset_strings.dart';
import '../../../../utils/constants.dart';

class DrinkScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const DrinkScreen({
    super.key,
    required this.onDataUpdated,
    required this.formKey, required this.onSkip, required this.onBack,
  });

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  late String selectedString;
  int isSelected = -1;

  // Define the list of drink options
  final List<Map<String, String>> drinkOptions = [
    {"label": "Never", "value": "Never"},
    {"label": "Occasionally", "value": "Occasionally"},
    {"label": "Regularly", "value": "Regularly"},
    {"label": "Often", "value": "Often"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                padding: const EdgeInsets.all(15.0),
                                decoration: const BoxDecoration(
                                  color: Color(0XFFf3f1fe),
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(AssetsStrings.drinkIcon),
                              ),
                            ),
                            const SizedBox(height: 22.0),
                            const Center(
                              child: Text(
                                "How Often Do You Drink?",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25.0),
                            // Dynamically generate drink options
                            ...drinkOptions.map((option) {
                              int index = drinkOptions.indexOf(option);
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
        widget.onDataUpdated("oftenDrink", selectedString);  // Save data
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
