import 'package:metroom/app/constants/app.supabase.credentials.dart';
import 'package:supabase/supabase.dart';

class SupabaseAPI {
  static SupabaseClient supabaseClient =
      SupabaseClient(SupabaseCredentials.APIURL, SupabaseCredentials.APIKEY);
}
