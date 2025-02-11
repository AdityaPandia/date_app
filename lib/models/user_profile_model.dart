import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:seting_app/models/user_account_settings_model.dart';

class HappeningQuestion {
  String? vacation;
  String? whatAreYouLooking;
  String? whatAreYourExercise;
  String? whatAreTwoWords;
  String? yourOpinionOnSmoking;
  String? whatAreYourEatingHabits;
  String? whatAboutKids;
  String? whenItComesToNightlife;
  String? whichAnswerBestDescribYourCooking;

  HappeningQuestion({
    this.vacation,
    this.whatAboutKids,
    this.whatAreTwoWords,
    this.whatAreYouLooking,
    this.whatAreYourEatingHabits,
    this.whatAreYourExercise,
    this.whenItComesToNightlife,
    this.whichAnswerBestDescribYourCooking,
    this.yourOpinionOnSmoking,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'what_about_kids': whatAboutKids});
    result.addAll({'what_are_two_words': whatAreTwoWords});
    result.addAll({"what_are_you_looking": whatAreYouLooking});
    result.addAll({'what_are_your_eating_habits': whatAreYourEatingHabits});
    result.addAll({'what_are_your_exercise': whatAreYourExercise});
    result.addAll({'when_it_comes_to_nightlife': whenItComesToNightlife});
    result.addAll({
      'which_answer_best_describ_your_cooking':
      whichAnswerBestDescribYourCooking
    });
    result.addAll({"vacation": vacation});
    result.addAll({'your_opinion_on_smoking': yourOpinionOnSmoking});

    return result;
  }

  factory HappeningQuestion.fromMap(Map<String, dynamic> map) {
    return HappeningQuestion(
        whatAboutKids: map["what_about_kids"],
        whatAreTwoWords: map["what_are_two_words"],
        whatAreYouLooking: map["what_are_you_looking"],
        whatAreYourEatingHabits: map["what_are_your_eating_habits"],
        whatAreYourExercise: map["what_are_your_exercise"],
        whenItComesToNightlife: map["when_it_comes_to_nightlife"],
        whichAnswerBestDescribYourCooking:
        map["which_answer_best_describ_your_cooking"],
        yourOpinionOnSmoking: map["your_opinion_on_smoking"],
        vacation: map["vacation"]);
  }
}

class SubscriptionModel {
  DateTime expiryTime;
  DateTime purchaseTime;
  String productID;
  String purchaseID;
  String title;

  SubscriptionModel({
    required this.expiryTime,
    required this.productID,
    required this.purchaseID,
    required this.purchaseTime,
    required this.title,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> map) {
    return SubscriptionModel(
      expiryTime: DateTime.parse(map["expiryTime"]),
      productID: map["productID"],
      purchaseID: map["purchaseID"],
      purchaseTime: DateTime.parse(map["purchaseTime"]),
      title: map["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "expiryTime": expiryTime.toIso8601String(),
      "productID": productID,
      "purchaseID": purchaseID,
      "purchaseTime": purchaseTime.toIso8601String(),
      "title": title,
    };
  }
}

class SwipeModel {
  int swipes;
  int reloads;
  DateTime? interactTime;

  SwipeModel({
    required this.swipes,
    required this.reloads,
    required this.interactTime,
  });

  Map<String, dynamic> toMap() {
    return {
      "swipes": swipes,
      "reloads": reloads,
      "interactTime":
      interactTime == null ? null : interactTime!.toIso8601String(),
    };
  }

  factory SwipeModel.fromMap(Map<String, dynamic> map) {
    return SwipeModel(
      swipes: map["swipes"],
      reloads: map["reloads"],
      interactTime: map["interactTime"] == null
          ? null
          : DateTime.parse(map["interactTime"]),
    );
  }
}

class UserProfileModel {
  String id;
  String userId;
  SwipeModel? swipeModel;
  String fullName;
  String? email;
  int? likes;
  String? likesRefilTime;
  int? boost;
  DateTime? boostDate;
  bool isPro;
  String? profilePicture;
  String? phoneNumber;
  String gender;
  String? about;
  int? flashMessages;
  String? school;
  String? showMe;
  DateTime birthDay;
  List<String> mediaFiles;
  List<String> interests;
  List<String>? orientation;
  SubscriptionModel? subscription;
  HappeningQuestion? happeningQuestion;
  UserAccountSettingsModel userAccountSettingsModel;
  bool isVerified;
  bool isOnline;

  UserProfileModel({
    this.school,
    this.showMe,
    this.likes,
    this.isPro = false,
    this.orientation,
    this.swipeModel,
    this.happeningQuestion,
    required this.id,
    required this.userId,
    required this.fullName,
    this.email,
    this.boost,
    this.boostDate,
    this.likesRefilTime,
    this.flashMessages,
    this.profilePicture,
    this.phoneNumber,
    required this.gender,
    this.about,
    required this.birthDay,
    required this.mediaFiles,
    required this.interests,
    required this.userAccountSettingsModel,
    required this.isVerified,
    this.isOnline = false,
    this.subscription,
  });

  UserProfileModel copyWith({
    int? likes,
    String? likesRefilTime,
    String? id,
    String? userId,
    String? fullName,
    String? email,
    DateTime? boostDate,
    String? profilePicture,
    String? phoneNumber,
    String? gender,
    int? boost,
    String? about,
    DateTime? birthDay,
    List<String>? mediaFiles,
    List<String>? interests,
    UserAccountSettingsModel? userAccountSettingsModel,
    bool? isVerified,
    bool? isOnline,
    List<String>? orientation,
    String? school,
    String? showMe,
    List<String>? whoLikedMe,
  }) {
    return UserProfileModel(
      school: school ?? this.school,
      showMe: showMe ?? this.showMe,
      orientation: orientation ?? this.orientation,
      id: id ?? this.id,
      isPro: isPro,
      boost: boost ?? this.boost,
      likes: likes ?? this.likes,
      likesRefilTime: likesRefilTime ?? this.likesRefilTime,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      boostDate: boostDate ?? this.boostDate,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      about: about ?? this.about,
      birthDay: birthDay ?? this.birthDay,
      mediaFiles: mediaFiles ?? this.mediaFiles,
      interests: interests ?? this.interests,
      userAccountSettingsModel:
      userAccountSettingsModel ?? this.userAccountSettingsModel,
      subscription: subscription,
      isVerified: isVerified ?? this.isVerified,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    if (happeningQuestion != null) {
      result.addAll({'happening_question': happeningQuestion!.toMap()});
    }
    if (swipeModel != null) {
      result.addAll({"swipeModel": swipeModel!.toMap()});
    }
    result.addAll({'school': school});
    result.addAll({'show_me': showMe});
    result.addAll({'boost': boost});
    result.addAll({"flashMessages": flashMessages ?? 3});
    result.addAll({'userId': userId});
    result.addAll({'fullName': fullName});
    if (likes != null) {
      result.addAll({'likes': likes});
    }
    if (boostDate != null) {
      result.addAll({'boostDate': boostDate!.toIso8601String()});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (profilePicture != null) {
      result.addAll({'profilePicture': profilePicture});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    result.addAll({'gender': gender});
    if (about != null) {
      result.addAll({'about': about});
    }
    result.addAll({"isPro": isPro});
    result.addAll({"subscription": subscription});
    result.addAll({'birthDay': birthDay.millisecondsSinceEpoch});
    result.addAll({'mediaFiles': mediaFiles});
    result.addAll({'orientation': orientation});
    result.addAll({'interests': interests});
    result
        .addAll({'userAccountSettingsModel': userAccountSettingsModel.toMap()});
    result.addAll({'isVerified': isVerified});
    result.addAll({'isOnline': isOnline});

    return result;
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] ?? '',
      boostDate: map["boostDate"] != null && map["boostDate"] != ""
          ? DateTime.parse(map["boostDate"])
          : null,
      orientation: List<String>.from(map["orientation"]),
      school: map["school"],
      swipeModel: map["swipeModel"] == null
          ? null
          : SwipeModel.fromMap(map["swipeModel"]),
      showMe: map["show_me"],
      happeningQuestion: map["happening_question"] != null
          ? HappeningQuestion.fromMap(map["happening_question"])
          : null,
      boost: map["boost"] ?? 0,
      userId: map['userId'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'],
      likes: map['likes'],
      subscription: map["subscription"] != null
          ? SubscriptionModel.fromJson(map["subscription"])
          : null,
      profilePicture: map['profilePicture'],
      phoneNumber: map['phoneNumber'],
      gender: map['gender'] ?? '',
      about: map['about'],
      isPro: map["isPro"] ?? false,
      flashMessages: map["flashMessages"] ?? 3,
      birthDay: DateTime.fromMillisecondsSinceEpoch(map['birthDay']),
      mediaFiles: List<String>.from(map['mediaFiles']),
      interests: List<String>.from(map['interests']),
      userAccountSettingsModel:
      UserAccountSettingsModel.fromMap(map['userAccountSettingsModel']),
      isVerified: map['isVerified'] ?? false,
      isOnline: map['isOnline'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) =>
      UserProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfileModel(id: $id, userId: $userId, fullName: $fullName, email: $email, profilePicture: $profilePicture, phoneNumber: $phoneNumber, gender: $gender, about: $about, birthDay: $birthDay, mediaFiles: $mediaFiles, interests: $interests, userAccountSettingsModel: $userAccountSettingsModel, isVerified: $isVerified, isOnline: $isOnline, flashMessages: $flashMessages)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserProfileModel &&
        other.id == id &&
        other.userId == userId &&
        other.fullName == fullName &&
        other.email == email &&
        other.profilePicture == profilePicture &&
        other.phoneNumber == phoneNumber &&
        other.gender == gender &&
        other.about == about &&
        other.birthDay == birthDay &&
        listEquals(other.mediaFiles, mediaFiles) &&
        listEquals(other.interests, interests) &&
        other.userAccountSettingsModel == userAccountSettingsModel &&
        other.isVerified == isVerified &&
        other.isOnline == isOnline;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    userId.hashCode ^
    fullName.hashCode ^
    email.hashCode ^
    profilePicture.hashCode ^
    phoneNumber.hashCode ^
    gender.hashCode ^
    about.hashCode ^
    birthDay.hashCode ^
    mediaFiles.hashCode ^
    interests.hashCode ^
    userAccountSettingsModel.hashCode ^
    isVerified.hashCode ^
    isOnline.hashCode;
  }
}
