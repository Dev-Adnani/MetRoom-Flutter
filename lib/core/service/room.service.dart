import 'package:metroom/core/api/supabase.api.dart';
import 'package:supabase/supabase.dart';

class RoomService {
  Future<PostgrestResponse> getAllRooms() async {
    PostgrestResponse response =
        await SupabaseAPI.supabaseClient.from("rooms").select().execute();
    return response;
  }

  Future<PostgrestResponse> getSpecificRoom({required int roomId}) async {
    PostgrestResponse response = await SupabaseAPI.supabaseClient
        .from("rooms")
        .select()
        .eq("room_id", roomId)
        .execute();
    return response;
  }
}
