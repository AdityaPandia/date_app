class UserModel {
  Data? data;
  bool? success;
  int? code;

  UserModel({this.data, this.success, this.code});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? livingIn;
  String? gender;
  String? birthday;
  String? school;
  String? showMe;
  String? sexialorientation;
  String? lookingFor;
  String? exerciseHabbit;
  String? idealVocation;
  String? smoking;
  String? eatingHabbit;
  String? communicationStyle;
  String? oftenDrink;
  String? height;
  String? aboutKids;
  String? zodiacSign;
  String? qualification;
  String? nightLife;
  String? cookingSkills;
  String? lat;
  String? long;
  String? email;
  String? status;
  String? jobTitle;
  String? company;
  bool? isOnline;
  int? ageRange;
  String? role;
  List<String>? media;
  List<String>? interest;
  String? phoneNumber;
  bool? hideBirthday;
  bool? hideLocation;
  bool? hideOnline;

  Data({
    this.id,
    this.name,
    this.gender,
    this.birthday,
    this.school,
    this.showMe,
    this.sexialorientation,
    this.lookingFor,
    this.exerciseHabbit,
    this.idealVocation,
    this.smoking,
    this.eatingHabbit,
    this.communicationStyle,
    this.oftenDrink,
    this.height,
    this.aboutKids,
    this.zodiacSign,
    this.qualification,
    this.nightLife,
    this.cookingSkills,
    this.lat,
    this.long,
    this.email,
    this.status,
    this.isOnline,
    this.ageRange,
    this.livingIn,
    this.role,
    this.phoneNumber,
    this.media,
    this.interest,
    this.jobTitle,
    this.company,
    this.hideBirthday,
    this.hideLocation,
    this.hideOnline,
  });

  Data.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'] ?? "";
    id = json['id'] ?? "NA";
    name = json['name'] ?? "NA";
    gender = json['gender'] ?? "NA";
    birthday = json['birthday'] ?? "NA";
    school = json['school'] ?? "NA";
    showMe = json['showMe'] ?? "NA";
    sexialorientation = json['sexialorientation'] ?? "NA";
    lookingFor = json['lookingFor'] ?? "NA";
    exerciseHabbit = json['exercise'] ?? "NA";
    idealVocation = json['idealVocation'] ?? "NA";
    smoking = json['smoking'] ?? "NA";
    eatingHabbit = json['eatingHabbit'] ?? "NA";
    communicationStyle = json['communctionStyle'] ?? "NA";
    oftenDrink = json['oftenDrink'] ?? "NA";
    height = json['height'] ?? "NA";
    aboutKids = json['aboutKids'] ?? "NA";
    zodiacSign = json['zodiacSign'] ?? "NA";
    qualification = json['qualifcation'] ?? "NA";
    nightLife = json['nightLife'] ?? "NA";
    cookingSkills = json['cookingSkills'] ?? "NA";
    livingIn = json['livingIn'] ?? 'NA';
    lat = json['lat'] ?? "NA";
    long = json['long'] ?? "NA";
    email = json['email'] ?? "NA";
    status = json['status'] ?? "NA";
    isOnline = json['isOnline'] ?? false;
    ageRange = json['ageRange'] ?? 18;
    role = json['role'] ?? "NA";
    media = json['media'].cast<String>();
    interest = json['interest'].cast<String>();
    jobTitle = json['jobTitle'] ?? "NA";
    company = json['company'] ?? 'NA';
    hideBirthday = json['hideBirthday'] ?? false;
    hideLocation = json['hideLocation'] ?? false;
    hideOnline = json['hideOnline'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['school'] = this.school;
    data['showMe'] = this.showMe;
    data['sexialorientation'] = this.sexialorientation;
    data['lookingFor'] = this.lookingFor;
    data['exercise'] = this.exerciseHabbit;
    data['idealVocation'] = this.idealVocation;
    data['smoking'] = this.smoking;
    data['eatingHabbit'] = this.eatingHabbit;
    data['communctionStyle'] = this.communicationStyle;
    data['oftenDrink'] = this.oftenDrink;
    data['height'] = this.height;
    data['aboutKids'] = this.aboutKids;
    data['zodiacSign'] = this.zodiacSign;
    data['qualifcation'] = this.qualification;
    data['nightLife'] = this.nightLife;
    data['cookingSkills'] = this.cookingSkills;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['email'] = this.email;
    data['status'] = this.status;
    data['isOnline'] = this.isOnline;
    data['ageRange'] = this.ageRange;
    data['role'] = this.role;
    data['media'] = this.media;
    data['interest'] = this.interest;
    data['jobTitle'] = this.jobTitle;
    data['company'] = this.company;
    data['livingIn'] = this.livingIn;
    data['hideBirthday'] = this.hideBirthday;
    data['hideLocation'] = this.hideLocation;
    data['hideOnline'] = this.hideOnline;
    data['media'] = this.media;
    data['interest'] = this.interest;
    data['role'] = this.role;
    data['isOnline'] = this.isOnline;
    data['status'] = this.status;
    data['email'] = this.email;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}
