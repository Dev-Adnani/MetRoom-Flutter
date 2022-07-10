import 'package:metroom/app/constants/app.credentials.dart';
import 'package:supabase/supabase.dart';

class SupabaseAPI {
  static SupabaseClient supabaseClient = SupabaseClient(
    AppCredentials.supabaseApiUrl,
    AppCredentials.supabaseApiKey,
  );
}
