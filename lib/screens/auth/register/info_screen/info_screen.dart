import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/constants.dart';
import '../../../../utils/all_strings.dart';

class InfoScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<InfoScreenState> screenKey; // Use GlobalKey for InfoScreenState

  final GlobalKey<FormState> formKey; // Add this key

  const InfoScreen({super.key, required this.onDataUpdated, required this.formKey, required this.screenKey});

  @override
  State<InfoScreen> createState() => InfoScreenState();

}


class InfoScreenState extends State<InfoScreen> {
  late String nameString;
  late String birthDateString;
  late TextEditingController nameController;
  late TextEditingController birthDateController;
  late FocusNode namenode;
  bool isGenderValid = true; // Flag for gender validation


  int isSelected = -1; // For gender selection
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    nameController = TextEditingController();
    birthDateController = TextEditingController();
    namenode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    namenode.dispose();
    super.dispose();
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1970, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        birthDateController.text = formatDate(selectedDate);
        birthDateString = formatDate(selectedDate);
        widget.onDataUpdated('birthday', birthDateController.text);
      });
    }
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 7.5.h),
                        Text(
                          AppStrings.welcomeMessage,
                          style: TextStyle(
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          AppStrings.fillDetail,
                          style: TextStyle(fontSize: 16.0.sp),
                        ),
                        SizedBox(height: 3.5.h),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.h),
                    child: Column(
                      children: [
                        _buildNameField(),
                        const SizedBox(height: 8.0),
                        _buildGenderSelection(),
                        const SizedBox(height: 8.0),
                        _buildBirthDateField(),
                        SizedBox(height: 1.5.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.myName,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: AppStrings.hintName,
                fillColor: transparentColor,
                filled: true,
                contentPadding: const EdgeInsets.only(left: 0.0, top: 20.0),
              ),
              focusNode: namenode,
              onChanged: (value) {
                nameString = value;
                widget.onDataUpdated('name', value);
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 18.0.sp),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name Required";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Container(
      width: double.infinity,
      child: Card(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                AppStrings.iAm,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              // Error message for gender selection

              const SizedBox(height: 8.0),
              _buildGenderOption(AppStrings.woman, 0),
              const SizedBox(height: 10.0),
              _buildGenderOption(AppStrings.man, 1),
              const SizedBox(height: 10.0),
              _buildGenderOption(AppStrings.other, 2),
              const SizedBox(height: 10.0),
              if (!isGenderValid)
                const Text(
                  "Please select an option",
                  style: TextStyle(color: AppColors.errorColor, fontSize: 12.0),
                ),
              // Button to trigger validation check
              // ElevatedButton(
              //   onPressed: () {
              //     if (!validateGenderSelection()) {
              //       setState(() {});
              //     }
              //   },
              //   child: const Text('Validate Selection'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateGenderSelection() {
    if (isSelected == -1) {
      isGenderValid = false;
      setState(() {});  // ✅ Force UI update when gender is invalid
      return false;
    }
    isGenderValid = true;
    setState(() {});  // ✅ Ensure UI rebuilds when gender is selected
    return true;
  }

  bool validateForm() {
    final formState = widget.formKey.currentState;
    bool isFormValid = formState != null && formState.validate();
    bool genderValid = validateGenderSelection();

    if (!isFormValid || !genderValid) {
      setState(() {}); // ✅ Force the UI to rebuild and show error message
    }

    return isFormValid && genderValid;
  }


  Widget _buildGenderOption(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
        widget.onDataUpdated('gender', label);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(17.0),
        decoration: BoxDecoration(
          color: isSelected == index ? AppColors.primary : AppColors.transparent,
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(color: const Color(0XFFE8E6EA)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected == index ? AppColors.white : AppColors.black,
                fontSize: 15.0,
              ),
            ),
         //   Icon(Icons.check,color:isSelected == index ? AppColors.white : Colors.grey[300] ,)
          ],
        ),
      ),
    );
  }

  Widget _buildBirthDateField() {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.myBirthday,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            TextFormField(
              readOnly: true,
              controller: birthDateController,
              onTap: () {
                _selectDate(context);
              },
              decoration: textInputDecoration.copyWith(
                hintText: AppStrings.birthFormat,
                fillColor: transparentColor,
                filled: true,
                contentPadding: const EdgeInsets.only(left: 0.0, top: 20.0),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
              style: TextStyle(fontSize: 18.0.sp),
              validator: (value) {
                if (value!.isEmpty) {
                  return "BirthDate Required";
                }

                // Parse the selected date
                DateTime? parsedDate = DateTime.tryParse(value);
                if (parsedDate == null) {
                  return "Invalid date format";
                }

                // Calculate the age
                int age = DateTime.now().year - parsedDate.year;
                if (DateTime.now().month < parsedDate.month ||
                    (DateTime.now().month == parsedDate.month &&
                        DateTime.now().day < parsedDate.day)) {
                  age--;
                }

                // Check if age is below 18
                if (age < 18) {
                  return "You must be at least 18 years old.";
                }

                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

}
