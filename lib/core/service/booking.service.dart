import 'package:metroom/core/api/supabase.api.dart';
import 'package:supabase/supabase.dart';

class BookingService {
  Future<PostgrestResponse> getBookingData({required int userId}) async {
    PostgrestResponse response = await SupabaseAPI.supabaseClient
        .from("bookings")
        .select("rooms(*),bookings_id,booking_price,booking_date")
        .eq("user_id", userId)
        .execute();
    return response;
  }
}
