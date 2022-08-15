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
    required this.bookingRazorid,
    required this.bookingPrice,
    required this.bookingStartDate,
    required this.bookingEndDate,
    required this.rooms,
  });

  String bookingRazorid;
  int bookingPrice;
  String bookingStartDate;
  String bookingEndDate;
  RoomModel rooms;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        bookingRazorid: json["booking_razorid"],
        bookingPrice: json["booking_price"],
        bookingStartDate: json["booking_start_date"],
        bookingEndDate: json["booking_end_date"],
        rooms: RoomModel.fromJson(json["rooms"]),
      );

  Map<String, dynamic> toJson() => {
        "booking_razorid": bookingRazorid,
        "booking_price": bookingPrice,
        "booking_start_date": bookingStartDate,
        "booking_end_date": bookingEndDate,
        "rooms": rooms.toJson(),
      };
}
