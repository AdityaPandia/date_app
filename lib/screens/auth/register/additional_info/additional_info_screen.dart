import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/all_strings.dart';
import 'package:seting_app/utils/asset_strings.dart';
import 'package:seting_app/utils/constants.dart';
import '../../../../widgets/interest_widget.dart';

class AdditionalInfoScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onBack; // Add onBack callback


  const AdditionalInfoScreen({
    Key? key,
    required this.onDataUpdated,
    required this.formKey, required this.onBack,
  }) : super(key: key);

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  late TextEditingController schoolNameController;
  late FocusNode schoolNameNode;
  int selectedGenderIndex = -1;
  List<String> selectedInterests = [];
  String? errorText; // Add this variable to hold the error message.


  @override
  void initState() {
    super.initState();
    schoolNameController = TextEditingController();
    schoolNameNode = FocusNode();
  }

  @override
  void dispose() {
    schoolNameController.dispose();
    schoolNameNode.dispose();
    super.dispose();
  }

  Widget _buildSchoolInput() {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.mySchool,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            TextFormField(
              controller: schoolNameController,
              focusNode: schoolNameNode,
              decoration: textInputDecoration.copyWith(
                hintText: AppStrings.schoolHint,
                fillColor: transparentColor,
                filled: true,
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              onChanged: (value) => widget.onDataUpdated('school', value),
              onEditingComplete: () => FocusScope.of(context).unfocus(),
              style: TextStyle(fontSize: 18.0.sp),
              validator: (value) =>
              value == null || value.isEmpty ? "School Name Required" : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelector() {
    final genders = [AppStrings.woman, AppStrings.man, AppStrings.other];

    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.showMe,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGenderIndex = index;
                        widget.onDataUpdated('showMe', genders[index]);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: selectedGenderIndex == index
                            ? primaryColor
                            : transparentColor,
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(color: const Color(0XFFE8E6EA)),
                      ),
                      child: Text(
                        genders[index],
                        style: TextStyle(
                          color: selectedGenderIndex == index
                              ? whiteColor
                              : blackColor,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                );
              }).expand((widget) => [widget, SizedBox(width: 4.5.w)]).toList()
                ..removeLast(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInterestSelector() {
    final interests = [
      {'title': AppStrings.photography, 'icon': AssetsStrings.photographyIcon},
      {'title': AppStrings.shopping, 'icon': AssetsStrings.shoppingIcon},
      {'title': AppStrings.cooking, 'icon': AssetsStrings.cookingIcon},
      {'title': AppStrings.tennis, 'icon': AssetsStrings.tennisIcon},
      {'title': AppStrings.travelling, 'icon': AssetsStrings.travellingIcon},
      {'title': AppStrings.swimming, 'icon': AssetsStrings.swimmingIcon},
      {'title': AppStrings.art, 'icon': AssetsStrings.artIcon},
      {'title': AppStrings.music, 'icon': AssetsStrings.musicIcon},
    ];

    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.myInterests,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const SizedBox(height: 13.0),
            if (errorText != null) // Display error message if it exists.
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              ),
            ...List.generate(interests.length ~/ 2, (rowIndex) {
              return Column(
                children: [
                  Row(
                    children: List.generate(2, (colIndex) {
                      final interest = interests[rowIndex * 2 + colIndex];
                      return Expanded(
                        child: InterestWidget(
                          intrestedList: selectedInterests,
                          onTap: () {
                            setState(() {
                              if (selectedInterests.contains(interest['title'])) {
                                selectedInterests.remove(interest['title']);
                                errorText = null; // Clear the error if an interest is removed.
                              } else if (selectedInterests.length < 5) {
                                selectedInterests.add(interest['title'] ?? "");
                                errorText = null; // Clear any error message.
                              } else {
                                errorText = "You can select up to 5 interests only.";
                              }
                              widget.onDataUpdated('interests', selectedInterests);
                            });
                          },
                          svgPath: interest['icon']!,
                          title: interest['title']!,
                        ),
                      );
                    }).expand((widget) => [widget, SizedBox(width: 4.5.w)]).toList()
                      ..removeLast(),
                  ),
                  const SizedBox(height: 10.0),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              buildHeader(onBack: widget.onBack),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: AppColors.lightPrimary,
                    padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.h),
                    child: Column(
                      children: [

                        _buildSchoolInput(),
                        const SizedBox(height: 8.0),
                        _buildGenderSelector(),
                        const SizedBox(height: 8.0),
                        _buildInterestSelector(),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
