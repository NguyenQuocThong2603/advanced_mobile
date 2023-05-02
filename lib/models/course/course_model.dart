class Course {
  late String id;
  late String name;
  late String description;
  late String imageUrl;
  late String level;
  late String reason;
  late String purpose;
  late String otherDetails;
  late int defaultPrice;
  late int coursePrice;
  late bool visible;
  late String createdAt;
  late String updatedAt;
  late int lessons;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.visible,
    required this.createdAt,
    required this.updatedAt,
    required this.lessons
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    level = json['level'] ?? "";
    reason = json['reason'] ?? "";
    purpose = json['purpose'] ?? "";
    otherDetails = json['other_details'] ?? "";
    defaultPrice = json['default_price'] ?? 0;
    coursePrice = json['course_price'] ?? 0;
    visible = json['visible'] ?? true;
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    if(json['topics']!= null ){
      lessons = json['topics'].length ?? 0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['level'] = level;
    data['reason'] = reason;
    data['purpose'] = purpose;
    data['other_details'] = otherDetails;
    data['default_price'] = defaultPrice;
    data['course_price'] = coursePrice;
    data['visible'] = visible;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['lessons'] = lessons;
    return data;
  }
}