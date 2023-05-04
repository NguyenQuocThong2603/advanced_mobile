import 'package:advanced_mobile/models/schedule/lesson_status.dart';

class ClassReview{
  String? behaviorComment;
  int? behaviorRating;
  String? homeworkComment;
  String? listeningComment;
  int? listeningRating;
  String? speakingComment;
  int? speakingRating;
  String? overallComment;
  String? vocabularyComment;
  int? vocabularyRating;
  LessonStatus? lessonStatus;

  ClassReview({
    this.behaviorComment,
    this.behaviorRating,
    this.homeworkComment,
    this.listeningComment,
    this.listeningRating,
    this.speakingComment,
    this.speakingRating,
    this.overallComment,
    this.vocabularyComment,
    this.vocabularyRating,
    this.lessonStatus,
  });

  ClassReview.fromJson(Map<String, dynamic> json) {
    behaviorComment = json['behaviorComment'];
    behaviorRating = json['behaviorRating'];
    homeworkComment = json['homeworkComment'];
    listeningComment = json['listeningComment'];
    listeningRating= json['listeningRating'];
    speakingComment = json['speakingComment'];
    speakingRating = json['speakingRating'];
    overallComment = json['overallComment'];
    vocabularyComment = json['vocabularyComment'];
    vocabularyRating = json['vocabularyRating'];
    lessonStatus = json['lessonStatus'] !=null ? LessonStatus.fromJson(json['lessonStatus']): null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['behaviorComment'] = behaviorComment;
    data['behaviorRating'] = behaviorRating;
    data['homeworkComment'] = homeworkComment;
    data['listeningComment'] = listeningComment;
    data['listeningRating'] = listeningRating;
    data['speakingComment'] = speakingComment;
    data['speakingRating'] = speakingRating;
    data['overallComment'] = overallComment;
    data['vocabularyComment'] = vocabularyComment;
    data['vocabularyRating'] = vocabularyRating;
    data['lessonStatus'] = lessonStatus;
    return data;
  }
}