import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../services/web_api.dart';
import '../../../../utils/all_strings.dart';
import '../../../../utils/constants.dart';

class AddPhotosScreen extends StatefulWidget {
  final Function(String, dynamic) onDataUpdated;
  final GlobalKey<FormState> formKey;
  final VoidCallback onBack; // Add onBack callback


  const AddPhotosScreen({
    Key? key,
    required this.onDataUpdated,
    required this.formKey, required this.onBack,
  }) : super(key: key);

  @override
  State<AddPhotosScreen> createState() => _AddPhotosScreenState();
}

class _AddPhotosScreenState extends State<AddPhotosScreen> {
  final ImagePicker _picker = ImagePicker();
  int _selectedOrientation = -1;
  Map<int, String?> _images = {};

  @override
  void initState() {
    super.initState();
  }

  // void _updateFormData(String? label) {
  //   widget.onDataUpdated(
  //       "images", _images.values.map((value) => value.toString()).toList());
  //
  //   widget.onDataUpdated("sexialorientation", label);
  // }



  Future<void> _pickImage(int index) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final uploadResponse = await WebConfig.uploadImage(imagePath: image.path);

      if (uploadResponse['success'] == true) {
        setState(() {
          _images[index] = uploadResponse['imageUrls'][0];
        });
        widget.onDataUpdated(
            "images", _images.values.map((value) => value.toString()).toList());      } else {
        EasyLoading.showError("Image upload failed");
      }
    } else {
      EasyLoading.showInfo("No image selected");
    }
  }

  Widget _buildImagePicker(int index) {
    final currentImage = _images[index];

    return Expanded(
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: const [3, 2],
        radius: const Radius.circular(12),
        strokeWidth: 1.8,
        color: primaryColor,
        child: InkWell(
          onTap: () => _pickImage(index),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: currentImage != null
                ? CachedNetworkImage(
                    imageUrl: currentImage,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  )
                : Container(
                    height: 150,
                    width: double.infinity,
                    color: const Color(0XFFf3f1fe),
                    child: const Icon(Icons.add_circle,
                        color: primaryColor, size: 40.0),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildSexualOrientationSelector(List<String> options) {
    return Column(
      children: List.generate(
        (options.length / 3).ceil(),
        (rowIndex) => Row(
          children: List.generate(
            3,
            (colIndex) {
              final index = rowIndex * 3 + colIndex;
              if (index >= options.length) return const Spacer();
              return _buildSelectableButton(index, options[index]);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSelectableButton(int value, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedOrientation = value;
          });
          widget.onDataUpdated(
              "sexialorientation", label);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color:
                _selectedOrientation == value ? primaryColor : transparentColor,
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(color: const Color(0XFFE8E6EA)),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: _selectedOrientation == value ? whiteColor : blackColor,
              fontSize: 14.0,
            ),
          ),
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
            // Add your header component here
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
                              const Text(
                                AppStrings.addPhotos,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 12.0),
                              Column(
                                children: [
                                  Row(
                                    children: List.generate(
                                        3, (index) => _buildImagePicker(index)) // First row with 3 containers
                                        .expand((widget) => [widget, const SizedBox(width: 12.0)])
                                        .toList()
                                      ..removeLast(),
                                  ),
                                  const SizedBox(height: 12.0), // Add spacing between rows
                                  Row(
                                    children: List.generate(
                                        2, (index) {
                                          return _buildImagePicker(index + 3);
                                        }) // Second row with 2 containers
                                        .expand((widget) => [widget, const SizedBox(width: 12.0)])
                                        .toList()
                                      ..removeLast(),
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Card(
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                AppStrings.mySexualOrientation,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(height: 12.0),
                              _buildSexualOrientationSelector([
                                AppStrings.straight,
                                AppStrings.gay,
                                AppStrings.lesbian,
                                AppStrings.biSexual,
                                AppStrings.deMiSexual,
                                AppStrings.aSexual,
                              ]),
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
}
