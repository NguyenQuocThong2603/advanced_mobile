class LessonStatus{
  String? status;
  LessonStatus({
    this.status
  });

  LessonStatus.fromJson(Map<String, dynamic> json){
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    return data;
  }
}