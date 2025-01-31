class CreateUserRequest {
  String? name;
  String? gender;
  String? birthday;
  String? school;
  String? showMe;
  List<String>? interests;
  List<String>? images;
  String? smoking;
  String? email;
  String? sexialorientation;
  String? lookingFor;
  String? exercies;
  String? height;
  String? idealVocation;
  String? eatingHabbit;
  String? communctionStyle;
  String? oftenDrink;
  String? aboutKids;
  String? zodiacSign;
  String? qualifcation;
  String? nightLife;
  String? cookingSkills;
  double? lat;
  double? long;

  CreateUserRequest(
      {this.name,
        this.gender,
        this.birthday,
        this.school,
        this.showMe,
        this.interests,
        this.images,
        this.smoking,
        this.email,
        this.sexialorientation,
        this.lookingFor,
        this.exercies,
        this.height,
        this.idealVocation,
        this.eatingHabbit,
        this.communctionStyle,
        this.oftenDrink,
        this.aboutKids,
        this.zodiacSign,
        this.qualifcation,
        this.nightLife,
        this.cookingSkills,
        this.lat,
        this.long});

  CreateUserRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    birthday = json['birthday'];
    school = json['school'];
    showMe = json['showMe'];
    interests = json['interests'].cast<String>();
    images = json['images'].cast<String>();
    smoking = json['smoking'];
    email = json['email'];
    sexialorientation = json['sexialorientation'];
    lookingFor = json['lookingFor'];
    exercies = json['exercise'];
    height = json['height'];
    idealVocation = json['idealVocation'];
    eatingHabbit = json['eatingHabbit'];
    communctionStyle = json['communctionStyle'];
    oftenDrink = json['oftenDrink'];
    aboutKids = json['aboutKids'];
    zodiacSign = json['zodiacSign'];
    qualifcation = json['qualifcation'];
    nightLife = json['nightLife'];
    cookingSkills = json['cookingSkills'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['school'] = this.school;
    data['showMe'] = this.showMe;
    data['interests'] = this.interests;
    data['images'] = this.images;
    data['smoking'] = this.smoking;
    data['email'] = this.email;
    data['sexialorientation'] = this.sexialorientation;
    data['lookingFor'] = this.lookingFor;
    data['exercise'] = this.exercies;
    data['height'] = this.height;
    data['idealVocation'] = this.idealVocation;
    data['eatingHabbit'] = this.eatingHabbit;
    data['communctionStyle'] = this.communctionStyle;
    data['oftenDrink'] = this.oftenDrink;
    data['aboutKids'] = this.aboutKids;
    data['zodiacSign'] = this.zodiacSign;
    data['qualifcation'] = this.qualifcation;
    data['nightLife'] = this.nightLife;
    data['cookingSkills'] = this.cookingSkills;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}