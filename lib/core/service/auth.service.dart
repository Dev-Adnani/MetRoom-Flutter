import 'package:metroom/app/constants/app.supabase.credentials.dart';
import 'package:metroom/core/api/supabase.api.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<void> signUp({required String email, required String password}) async {
    GotrueSessionResponse res =
        await SupabaseAPI.supabaseClient.auth.signUp(email, password);
    if (res.error == null) {
      print(res.user!.email);
    } else {
      print(res.error!.message);
    }
  }

  Future<void> login({required String email, required String password}) async {
    GotrueSessionResponse res = await SupabaseAPI.supabaseClient.auth.signIn(
      email: email,
      password: password,
      options: AuthOptions(
        redirectTo: SupabaseCredentials.APIURL,
      ),
    );
    if (res.error == null) {
      print("ID -> Login -> ${res.user!.id}");
    } else {
      print(res.error!.message);
    }
  }
}
