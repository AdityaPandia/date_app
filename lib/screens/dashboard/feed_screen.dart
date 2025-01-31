import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/constants.dart';
import '../../widgets/feed_item.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late FocusNode searchNode;
  late String searchString;

  @override
  void initState() {
    searchNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf3f1fe),
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          "Feeds",
          style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
              color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w,bottom: 7.5.h),
        child: Column(
          children: [
            SizedBox(
              height: 2.5.h,
            ),
            TextFormField(
              decoration: textInputDecoration2.copyWith(
                  hintText: "Share your thoughts",
                  fillColor: whiteColor,
                  suffixIcon: Container(
                      margin: const EdgeInsets.all(7.0),
                      width: 20.0,
                      height: 20.0,
                      decoration: const BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle),
                      child: Image.asset("assets/images/search_icon.png")),
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 20.0, top: 20.0)),
              // focusNode: namenode,
              onChanged: (value) {
                searchString = value;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onEditingComplete: () {},
              style: TextStyle(fontSize: 14.0.sp),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Name Required";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 2.5.h,
            ),
            const FeedItem(),
            SizedBox(
              height: 2.5.h,
            ),
            const FeedItem(),
          ],
        ),
      ),
    );
  }
}
