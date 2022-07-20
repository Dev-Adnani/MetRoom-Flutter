import 'package:metroom/app/constants/app.credentials.dart';
import 'package:metroom/core/api/supabase.api.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<GotrueSessionResponse> signUp(
      {required String email, required String password}) async {
    GotrueSessionResponse res =
        await SupabaseAPI.supabaseClient.auth.signUp(email, password);
    return res;
  }

  Future<GotrueSessionResponse> login(
      {required String email, required String password}) async {
    GotrueSessionResponse res = await SupabaseAPI.supabaseClient.auth.signIn(
      email: email,
      password: password,
      options: AuthOptions(
        redirectTo: AppCredentials.supabaseApiUrl,
      ),
    );
    return res;
  }

  Future<PostgrestResponse> updateUserData(
      {required String useremail,
      required String username,
      required String userMobileNo,
      required String userPhoto}) async {
    PostgrestResponse? response = await SupabaseAPI.supabaseClient
        .from("users")
        .update({
          'user_name': username,
          'user_profile_url': userPhoto,
          'user_phone_no': userMobileNo
        })
        .eq("user_email", useremail)
        .execute();
    return response;
  }
}
