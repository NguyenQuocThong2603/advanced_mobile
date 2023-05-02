import 'package:advanced_mobile/models/course/course_model.dart';
import 'package:advanced_mobile/models/user/wallet_model.dart';

class User{
  late String id;
  late String email;
  String? google;
  String? facebook;
  String? apple;
  late String name;
  late String avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  late bool isActivated;
  late List<Course> courses;
  String? requireNote;
  String? level;
  bool? isPhoneActivated;
  int? timezone;
  Wallet? walletInfo;

  User({
    required this.id,
    required this.email,
    this.google,
    this.facebook,
    this.apple,
    required this.name,
    required this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    required this.isActivated,
    required this.courses,
    this.requireNote,
    this.level,
    this.isPhoneActivated,
    this.timezone,
    this.walletInfo,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'] ?? "";
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    phone = json['phone'];
    language = json['language'];
    birthday = json['birthday'];
    isActivated = json['isActivated'] ?? true;
    google = json['google'];
    facebook = json['facebook'];
    apple = json['apple'];

    roles = json['roles']?.cast<String>();

    requireNote = json['requireNote'];
    level = json['level'];

    isPhoneActivated = json['isPhoneActivated'];
    timezone = json['timezone'];
    if (json['courses'] != null) {
      courses = [];
      json['courses'].forEach((v) {
        courses.add(Course.fromJson(v));
      });
    }
    walletInfo = json['walletInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data["google"] = google;
    data["facebook"] = facebook;
    data["apple"] = apple;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['phone'] = phone;
    data['roles'] = roles;
    data['language'] = language;
    data['birthday'] = birthday;
    data['isActivated'] = isActivated;
    data['courses'] = courses; //.map((v) => v.toJson()).toList();
    data['requireNote'] = requireNote;
    data['level'] = level;
    data['isPhoneActivated'] = isPhoneActivated;
    data['timezone'] = timezone;
    data['courses'] = courses;
    data['walletInfo'] = walletInfo;
    return data;
  }
}