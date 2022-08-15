import 'package:metroom/core/api/supabase.api.dart';
import 'package:metroom/core/models/booking.model.dart';
import 'package:supabase/supabase.dart';

class BookingService {
  Future<PostgrestResponse> getBookingData({required int userId}) async {
    PostgrestResponse response = await SupabaseAPI.supabaseClient
        .from("bookings")
        .select(
            "booking_razorid,booking_price,booking_start_date,booking_end_date,rooms(*)")
        .eq("user_id", userId)
        .execute();
    return response;
  }

  Future<PostgrestResponse?> confirmBooking({
    required BookingModel bookingModel,
    required int userId,
    required int roomId,
  }) async {
    try {
      PostgrestResponse? response =
          await SupabaseAPI.supabaseClient.from("bookings").insert({
        "room_id": roomId,
        "user_id": userId,
        "booking_razorid": bookingModel.bookingRazorid,
        "booking_price": bookingModel.bookingPrice,
        "booking_start_date": bookingModel.bookingStartDate,
        "booking_end_date": bookingModel.bookingEndDate,
      }).execute();
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
