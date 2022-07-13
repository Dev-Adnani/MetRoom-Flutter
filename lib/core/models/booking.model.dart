// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';
import 'package:metroom/core/models/room.model.dart';

List<BookingModel> bookingModelFromJson(String str) => List<BookingModel>.from(
    json.decode(str).map((x) => BookingModel.fromJson(x)));

String bookingModelToJson(List<BookingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingModel {
  BookingModel({
    required this.bookingsId,
    required this.bookingPrice,
    required this.bookingDate,
    required this.rooms,
  });

  int bookingsId;
  int bookingPrice;
  String bookingDate;
  RoomModel rooms;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        bookingsId: json["bookings_id"],
        bookingPrice: json["booking_price"],
        bookingDate: json["booking_date"],
        rooms: RoomModel.fromJson(json["rooms"]),
      );

  Map<String, dynamic> toJson() => {
        "bookings_id": bookingsId,
        "booking_price": bookingPrice,
        "booking_date": bookingDate,
        "rooms": rooms.toJson(),
      };
}
