import 'dart:convert';

List<RoomModel> roomModelFromJson(String str) =>
    List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromJson(x)));

String roomModelToJson(List<RoomModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomModel {
  RoomModel({
    required this.roomId,
    required this.createdAt,
    required this.roomName,
    required this.roomType,
    required this.roomAddress,
    required this.roomPrice,
    required this.roomAmenities,
    required this.roomPhotos,
    required this.roomStatus,
    required this.roomRating,
  });

  int roomId;
  String createdAt;
  String roomName;
  String roomType;
  String roomAddress;
  int roomPrice;
  double roomRating;
  List<String> roomAmenities;
  List<String> roomPhotos;
  bool roomStatus;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        roomRating: json["room_rating"],
        roomId: json["room_id"],
        createdAt: json["created_at"],
        roomName: json["room_name"],
        roomType: json["room_type"],
        roomAddress: json["room_address"],
        roomPrice: json["room_price"],
        roomAmenities: List<String>.from(json["room_amenities"].map((x) => x)),
        roomPhotos: List<String>.from(json["room_photos"].map((x) => x)),
        roomStatus: json["room_status"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "created_at": createdAt,
        "room_name": roomName,
        "room_type": roomType,
        "room_address": roomAddress,
        "room_price": roomPrice,
        "room_amenities": List<dynamic>.from(roomAmenities.map((x) => x)),
        "room_photos": List<dynamic>.from(roomPhotos.map((x) => x)),
        "room_status": roomStatus,
        "room_rating":roomRating
      };
}
