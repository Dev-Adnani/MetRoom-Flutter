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
    required this.roomAmenitiesText,
    required this.roomAmenitiesImages,
    required this.roomPhotos,
    required this.roomStatus,
    required this.roomRating,
    required this.roomDescription,
    required this.roomCallNo,
    required this.roomLat,
    required this.roomLong,
  });

  int roomId;
  String createdAt;
  String roomName;
  String roomType;
  String roomAddress;
  String roomDescription;
  int roomPrice;
  int roomCallNo;
  double roomLat;
  double roomLong;
  double roomRating;
  List<String> roomAmenitiesText;
  List<String> roomAmenitiesImages;
  List<String> roomPhotos;
  bool roomStatus;

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
        roomRating: json["room_rating"],
        roomId: json["room_id"],
        createdAt: json["created_at"],
        roomName: json["room_name"],
        roomType: json["room_type"],
        roomDescription: json["room_description"],
        roomAddress: json["room_address"],
        roomPrice: json["room_price"],
        roomAmenitiesText:
            List<String>.from(json["room_amenities_text"].map((x) => x)),
        roomAmenitiesImages:
            List<String>.from(json["room_amenities_image"].map((x) => x)),
        roomPhotos: List<String>.from(json["room_photos"].map((x) => x)),
        roomStatus: json["room_status"],
        roomCallNo: json['room_phone_call'],
        roomLat: json['room_lat'],
        roomLong: json['room_long'],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "created_at": createdAt,
        "room_name": roomName,
        "room_type": roomType,
        "room_address": roomAddress,
        "room_price": roomPrice,
        "room_amenities": List<dynamic>.from(roomAmenitiesText.map((x) => x)),
        "room_amenities_image":
            List<dynamic>.from(roomAmenitiesImages.map((x) => x)),
        "room_photos": List<dynamic>.from(roomPhotos.map((x) => x)),
        "room_status": roomStatus,
        "room_rating": roomRating,
        "room_description": roomDescription,
        "room_long": roomLong,
        "room_lat": roomLat,
        "room_phone_call": roomCallNo,
      };
}
