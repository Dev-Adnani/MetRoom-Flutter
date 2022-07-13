import 'package:flutter/material.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/service/room.service.dart';

class RoomNotifier extends ChangeNotifier {
  final RoomService roomService = RoomService();

  Future getAllRooms() async {
    var data = await roomService.getAllRooms();
    return data.data
        .map((todoElement) => RoomModel.fromJson(todoElement))
        .toList();
  }

  Future getSpecificRoom({required int roomId}) async {
    var data = await roomService.getSpecificRoom(roomId: roomId);
    return data.data
        .map((todoElement) => RoomModel.fromJson(todoElement))
        .toList();
  }
}
