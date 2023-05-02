import 'package:advanced_mobile/models/user/user_model.dart';

class Tutor {
  late String id;
  late String userId;
  String? video;
  late String bio;
  late String education;
  late String experience;
  late String profession;
  String? accent;
  String? targetStudent;
  late String interests;
  late String languages;
  late String specialties;
  String? resume;
  late bool isActivated;
  bool? isNative;
  late String createdAt;
  late String updatedAt;
  bool? isFavorite;
  double? rating;
  late int price;
  String? name;
  String? avatar;
  String? country;
  bool? isFavouriteTutor;
  User? user;
  int? totalFeedback;

  Tutor({
    required this.id,
    required this.userId,
    this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    this.accent,
    this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    this.resume,
    required this.isActivated,
    this.isNative,
    required this.createdAt,
    required this.updatedAt,
    this.isFavorite,
    this.rating,
    required this.price,
    required this.country,
    this.user,
    this.isFavouriteTutor,
    this.totalFeedback
  });

  Tutor.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    userId = json['userId'] ?? "";
    video = json['video'];
    bio = json['bio'] ?? "";
    education = json['education'] ?? "";
    experience = json['experience'] ?? "";
    profession = json['profession'] ?? "";
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'] ?? "";
    languages = json['languages'] ?? "";
    specialties = json['specialties'] ?? "";
    resume = json['resume'];
    isActivated = json['isActivated'] ?? true;
    isNative = json['isNative'];
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt']?? "";
    isFavorite = json['isfavoritetutor'] == null ? false: true;
    rating = json['rating'] != null ? json['rating'].toDouble() : 0;
    price = json['price'] ?? 0;
    name = json['name'];
    avatar = json['avatar'];
    country = json['country'];
    isFavouriteTutor = json['isFavorite'];
    user = json["User"] != null ? User.fromJson(json['User']) : null;
    totalFeedback = json["totalFeedback"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['userId'] = userId;
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['accent'] = accent;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['resume'] = resume;
    data['isActivated'] = isActivated;
    data['isNative'] = isNative;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['isFavorite'] = isFavorite;
    data['rating'] = rating;
    data['price'] = price;
    data['name'] = name;
    data['avatar'] = avatar;
    data['country'] = country;
    data['user'] = user?.toJson();
    data['isFavorite'] = isFavouriteTutor;
    data['totalFeedback'] = totalFeedback;
    return data;
  }
}