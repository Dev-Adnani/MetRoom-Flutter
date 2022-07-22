import 'package:flutter/material.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/service/room.service.dart';
import 'package:supabase/supabase.dart';

enum RoomSort { ByPrice, ByRating, ByAmentities, ByAscendingOrder, Normal }

class RoomNotifier extends ChangeNotifier {
  final RoomService roomService = RoomService();

  Future getAllRooms({required RoomSort roomSort}) async {
    PostgrestResponse allRoomsData = await roomService.getAllRooms();
    var roomList = allRoomsData.data
        .map((element) => RoomModel.fromJson(element))
        .toList();
    if (roomSort == RoomSort.Normal) {
      return roomList;
    } else if (roomSort == RoomSort.ByPrice) {
    } else if (roomSort == RoomSort.ByRating) {
    } else if (roomSort == RoomSort.ByAmentities) {
    } else if (roomSort == RoomSort.ByAscendingOrder) {
      print(roomList!.sort());
      return [];
    }
  }

  Future getSpecificRoom({required int roomId}) async {
    var data = await roomService.getSpecificRoom(roomId: roomId);
    return data.data.map((element) => RoomModel.fromJson(element)).toList();
  }

  Future getSearchRooms({required String roomName}) async {
    var data = await roomService.getSearchRooms(roomName: roomName);
    return data.data.map((element) => RoomModel.fromJson(element)).toList();
  }
}
