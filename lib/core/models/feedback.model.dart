import 'dart:convert';

List<FeedbackModel> feedbackModelFromJson(String str) =>
    List<FeedbackModel>.from(
        json.decode(str).map((x) => FeedbackModel.fromJson(x)));

String feedbackModelToJson(List<FeedbackModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedbackModel {
  FeedbackModel({
     this.feedbackId,
    required this.createdAt,
    required this.feedbackTitle,
    required this.feedbackDescription,
    required this.feedbackStars,
    required this.userId,
  });

  int? feedbackId;
  String createdAt;
  String feedbackTitle;
  String feedbackDescription;
  double feedbackStars;
  int userId;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        feedbackId: json["feedback_id"],
        createdAt: json["created_at"],
        feedbackTitle: json["feedback_title"],
        feedbackDescription: json["feedback_description"],
        feedbackStars: json["feedback_stars"].toDouble(),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "feedback_id": feedbackId,
        "created_at": createdAt,
        "feedback_title": feedbackTitle,
        "feedback_description": feedbackDescription,
        "feedback_stars": feedbackStars,
        "user_id": userId,
      };
}
