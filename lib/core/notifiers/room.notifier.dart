import 'package:flutter/material.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/service/room.service.dart';
import 'package:supabase/supabase.dart';

class RoomNotifier extends ChangeNotifier {
  final RoomService roomService = RoomService();
  PostgrestResponse? allRoomsData;
  Future getAllRooms() async {
    if (allRoomsData == null) {
      allRoomsData = await roomService.getAllRooms();
      notifyListeners();
      return allRoomsData!.data
          .map((element) => RoomModel.fromJson(element))
          .toList();
    } else {
      return allRoomsData!.data
          .map((element) => RoomModel.fromJson(element))
          .toList();
    }
  }

  Future getSpecificRoom({required int roomId}) async {
    var data = await roomService.getSpecificRoom(roomId: roomId);
    return data.data
        .map((element) => RoomModel.fromJson(element))
        .toList();
  }
}
