import 'dart:convert';

List<EventsModel> eventsModelFromJson(String str) => List<EventsModel>.from(
    json.decode(str).map((x) => EventsModel.fromJson(x)));

String eventsModelToJson(List<EventsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventsModel {
  EventsModel({
    required this.eventId,
    required this.eventImage,
    required this.eventType,
    required this.eventName,
    required this.eventLocation,
    required this.eventDate,
    required this.eventCharges,
  });

  int eventId;
  String eventImage;
  String eventType;
  String eventName;
  String eventLocation;
  String eventDate;
  int eventCharges;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        eventId: json["event_id"],
        eventImage: json["event_image"],
        eventType: json["event_type"],
        eventName: json["event_name"],
        eventLocation: json["event_location"],
        eventDate: json["event_date"],
        eventCharges: json["event_charges"],
      );

  Map<String, dynamic> toJson() => {
        "event_id": eventId,
        "event_image": eventImage,
        "event_type": eventType,
        "event_name": eventName,
        "event_location": eventLocation,
        "event_date": eventDate,
        "event_charges": eventCharges,
      };
}
