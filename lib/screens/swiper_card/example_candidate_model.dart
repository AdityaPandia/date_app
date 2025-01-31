import 'package:flutter/cupertino.dart';

class ExampleCandidateModel {
  String? name;
  String? job;
  String? city;
  String? imageAsset;
  LinearGradient? color;

  ExampleCandidateModel({
    this.name,
    this.job,
    this.city,
    this.color,
    this.imageAsset,
  });
}

List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientPink,
    imageAsset: "assets/images/1.png"
  ),
  ExampleCandidateModel(
  name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientBlue,
    imageAsset: "assets/images/2.png"
  ),
  ExampleCandidateModel(
  name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientPurple,
    imageAsset: "assets/images/1.png"
  ),
  ExampleCandidateModel(
  name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientRed,
    imageAsset: "assets/images/2.png"
  ),
  ExampleCandidateModel(
   name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientPink,
    imageAsset: "assets/images/1.png"
  ),
  ExampleCandidateModel(
   name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientBlue,
    imageAsset: "assets/images/2.png"
  ),
  ExampleCandidateModel(
   name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientPurple,
    imageAsset: "assets/images/1.png"
  ),
  ExampleCandidateModel(
   name: 'Jessica Parker, 23',
    job: 'Professional model',
    city: 'Town',
    color: gradientRed,
    imageAsset: "assets/images/2.png"
  ),
];

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
