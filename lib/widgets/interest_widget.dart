
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seting_app/utils/constants.dart';


class InterestWidget extends StatelessWidget {
  final String svgPath;
  final String title;
  final List<String> intrestedList;
  final Function() onTap;
  const InterestWidget(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.onTap,
      required this.intrestedList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color:
                intrestedList.contains(title) ? AppColors.primary : AppColors.transparent,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: const Color(0XFFE8E6EA)),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                svgPath,
                color:
                    intrestedList.contains(title) ? AppColors.white : AppColors.primary,
              ),
              SizedBox(
                width: 3.0.w,
              ),
              Text(
                title,
                style: TextStyle(
                  color:
                      intrestedList.contains(title) ? whiteColor : blackColor,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
