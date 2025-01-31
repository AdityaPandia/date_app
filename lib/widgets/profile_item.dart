import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';


class ProfileItem extends StatelessWidget {
  final String? fieldName;
  final String? value;
  const ProfileItem({super.key, required this.fieldName, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
      color: whiteColor,
      surfaceTintColor: whiteColor,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fieldName ?? "-",
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                value ?? "-",
                style:
                    const TextStyle(color: Color(0XFF718190), fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
