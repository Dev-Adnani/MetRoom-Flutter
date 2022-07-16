// To parse this JSON data, do
//
//     final favouriteModel = favouriteModelFromJson(jsonString);

import 'dart:convert';

import 'package:metroom/core/models/room.model.dart';

List<FavouriteModel> favouriteModelFromJson(String str) =>
    List<FavouriteModel>.from(
        json.decode(str).map((x) => FavouriteModel.fromJson(x)));

String favouriteModelToJson(List<FavouriteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavouriteModel {
  FavouriteModel({
    required this.favouriteId,
    required this.userId,
    required this.rooms,
  });

  int favouriteId;
  int userId;
  RoomModel rooms;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        favouriteId: json["favourite_id"],
        userId: json["user_id"],
        rooms: RoomModel.fromJson(json["rooms"]),
      );

  Map<String, dynamic> toJson() => {
        "favourite_id": favouriteId,
        "user_id": userId,
        "rooms": rooms.toJson(),
      };
}
