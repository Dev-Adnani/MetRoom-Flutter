import 'package:metroom/core/api/supabase.api.dart';
import 'package:metroom/core/models/feedback.model.dart';
import 'package:supabase/supabase.dart';

class FeedbackService {
  Future<PostgrestResponse?> saveFeedback(
      {required FeedbackModel feedbackModel}) async {
    try {
      PostgrestResponse? response =
          await SupabaseAPI.supabaseClient.from("feedback").insert({
        "created_at": feedbackModel.createdAt.toString(),
        "user_id": feedbackModel.userId,
        "feedback_title": feedbackModel.feedbackTitle,
        "feedback_description": feedbackModel.feedbackDescription,
        "feedback_stars": feedbackModel.feedbackStars,
      }).execute();
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
