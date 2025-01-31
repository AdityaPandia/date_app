class AllUsersResponse {
  List<AllUserData>? data;
  bool? success;
  int? code;

  AllUsersResponse({this.data, this.success, this.code});

  AllUsersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AllUserData>[];
      json['data'].forEach((v) {
        data!.add(new AllUserData.fromJson(v));
      });
    }
    success = json['success'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['code'] = this.code;
    return data;
  }
}

class AllUserData {
  String? id;
  String? name;
  String? gender;
  int? birthday;
  String? school;
  String? showMe;
  String? sexialorientation;
  String? lookingFor;
  String? exercise;
  String? idealVocation;
  String? smoking;
  String? eatingHabbit;
  String? communctionStyle;
  String? oftenDrink;
  String? height;
  String? aboutKids;
  String? zodiacSign;
  String? qualifcation;
  String? nightLife;
  String? cookingSkills;
  String? lat;
  String? long;
  String? email;
  String? status;
  bool? isOnline;
  Null? ageRange;
  String? role;
  List<String>? media;
  List<String>? interest;

  AllUserData(
      {this.id,
        this.name,
        this.gender,
        this.birthday,
        this.school,
        this.showMe,
        this.sexialorientation,
        this.lookingFor,
        this.exercise,
        this.idealVocation,
        this.smoking,
        this.eatingHabbit,
        this.communctionStyle,
        this.oftenDrink,
        this.height,
        this.aboutKids,
        this.zodiacSign,
        this.qualifcation,
        this.nightLife,
        this.cookingSkills,
        this.lat,
        this.long,
        this.email,
        this.status,
        this.isOnline,
        this.ageRange,
        this.role,
        this.media,
        this.interest});

  AllUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    birthday = json['birthday'];
    school = json['school'];
    showMe = json['showMe'];
    sexialorientation = json['sexialorientation'];
    lookingFor = json['lookingFor'];
    exercise = json['exercise'];
    idealVocation = json['idealVocation'];
    smoking = json['smoking'];
    eatingHabbit = json['eatingHabbit'];
    communctionStyle = json['communctionStyle'];
    oftenDrink = json['oftenDrink'];
    height = json['height'];
    aboutKids = json['aboutKids'];
    zodiacSign = json['zodiacSign'];
    qualifcation = json['qualifcation'];
    nightLife = json['nightLife'];
    cookingSkills = json['cookingSkills'];
    lat = json['lat'];
    long = json['long'];
    email = json['email'];
    status = json['status'];
    isOnline = json['isOnline'];
    ageRange = json['ageRange'];
    role = json['role'];
    media = json['media'].cast<String>();
    interest = json['interest'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['school'] = this.school;
    data['showMe'] = this.showMe;
    data['sexialorientation'] = this.sexialorientation;
    data['lookingFor'] = this.lookingFor;
    data['exercise'] = this.exercise;
    data['idealVocation'] = this.idealVocation;
    data['smoking'] = this.smoking;
    data['eatingHabbit'] = this.eatingHabbit;
    data['communctionStyle'] = this.communctionStyle;
    data['oftenDrink'] = this.oftenDrink;
    data['height'] = this.height;
    data['aboutKids'] = this.aboutKids;
    data['zodiacSign'] = this.zodiacSign;
    data['qualifcation'] = this.qualifcation;
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
    return data;
  }
}