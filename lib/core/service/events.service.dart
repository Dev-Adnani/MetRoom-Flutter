import 'package:metroom/core/api/supabase.api.dart';
import 'package:supabase/supabase.dart';

class EventsService {
  Future<PostgrestResponse> getAllEvents() async {
    PostgrestResponse response =
        await SupabaseAPI.supabaseClient.from("events").select().execute();
    return response;
  }
}
