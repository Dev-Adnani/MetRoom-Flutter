import 'package:flutter/material.dart';
import 'package:metroom/core/models/booking.model.dart';
import 'package:metroom/core/service/booking.service.dart';

class BookingNotifier extends ChangeNotifier {
  final BookingService bookingService = BookingService();

  Future getSpecificRoom({required int userId}) async {
    var data = await bookingService.getBookingData(userId: userId);
    return data.data
        .map((element) => BookingModel.fromJson(element))
        .toList();
  }
}
