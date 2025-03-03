import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/constants.dart';
import 'package:seting_app/widgets/app_themed_button.dart';

class AccountSettingUpdateScreen extends StatefulWidget {
  const AccountSettingUpdateScreen({super.key, required this.question});
  final Widget question;
  @override
  State<AccountSettingUpdateScreen> createState() =>
      _AccountSettingUpdateScreenState();
}

class _AccountSettingUpdateScreenState
    extends State<AccountSettingUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 700, child: widget.question),
            Container(
              color: AppColors.lightPrimary,
              padding: const EdgeInsets.all(16.0),
              child: AppThemedButton(
                onPressed: () {
                  Get.back();
                },
                withIcon: false,
                label: "Continue",
                backgroundColor: AppColors.primary,
                labelColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
