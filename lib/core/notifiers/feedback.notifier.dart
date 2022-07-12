import 'package:flutter/material.dart';
import 'package:metroom/core/models/feedback.model.dart';
import 'package:metroom/core/service/feedback.service.dart';

class FeedbackNotifier extends ChangeNotifier {
  String? error;
  String? errorCode;

  final FeedbackService feedbackService = FeedbackService();

  Future<bool> saveFeedback({required FeedbackModel feedbackModel}) async {
    var data = await feedbackService.saveFeedback(feedbackModel: feedbackModel);
    if (data!.hasError) {
      errorCode = data.error!.code;

      if (errorCode == "23505") {
        error = "You Have Already Submitted Feedback Before";
      } else {
        error = data.error!.message;
      }

      notifyListeners();
      return false;
    } else {
      return true;
    }
  }

  // For Development Purpose
  Future getFeedbackData() async {
    var data = await feedbackService.getFeedbackData();
    print(data!.data);
  }
}
