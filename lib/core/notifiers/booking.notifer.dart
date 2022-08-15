import 'package:flutter/material.dart';
import 'package:metroom/core/models/booking.model.dart';
import 'package:metroom/core/service/booking.service.dart';

class BookingNotifier extends ChangeNotifier {
  final BookingService bookingService = BookingService();
  String? error;

  Future getSpecificRoom({required int userId}) async {
    var data = await bookingService.getBookingData(userId: userId);
    return data.data.map((element) => BookingModel.fromJson(element)).toList();
  }

  Future<bool> confirmBooking({
    required BookingModel bookingModel,
    required int userId,
    required int roomId,
  }) async {
    var data = await bookingService.confirmBooking(
      bookingModel: bookingModel,
      userId: userId,
      roomId: roomId,
    );
    if (data!.hasError) {
      error = data.error!.message;
      notifyListeners();
      return false;
    } else {
      return true;
    }
  }
}
