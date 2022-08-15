import 'package:flutter/material.dart';
import 'package:metroom/core/models/room.model.dart';
import 'package:metroom/core/notifiers/sorts.notifier.dart';
import 'package:metroom/core/service/room.service.dart';
import 'package:supabase/supabase.dart';

class RoomNotifier extends ChangeNotifier {
  final RoomService roomService = RoomService();

  Future getAllRooms(
      {required RoomSort roomSort, required SortingSystem sortBy}) async {
    PostgrestResponse allRoomsData = await roomService.getAllRooms();
    List<RoomModel> roomList = (allRoomsData.data as List<dynamic>)
        .map((element) => RoomModel.fromJson(element))
        .toList();
        
    if (sortBy == SortingSystem.ByAscendingOrder) {
      if (roomSort == RoomSort.Normal) {
        return roomList;
      } else if (roomSort == RoomSort.ByPrice) {
        Comparator<RoomModel> priceComparator =
            (a, b) => a.roomPrice.compareTo(b.roomPrice);
        roomList.sort(priceComparator);
        return roomList;
      } else if (roomSort == RoomSort.ByRating) {
        Comparator<RoomModel> ratingComp =
            (a, b) => a.roomPrice.compareTo(b.roomPrice);
        roomList.sort(ratingComp);
        return roomList;
      } else if (roomSort == RoomSort.ByAmentities) {
        Comparator<RoomModel> amentitiesComp = (a, b) => a
            .roomAmenitiesImages.length
            .compareTo(b.roomAmenitiesImages.length);
        roomList.sort(amentitiesComp);
        return roomList;
      }
    } else if (sortBy == SortingSystem.ByDescendingOrder) {
      if (roomSort == RoomSort.Normal) {
        return roomList;
      } else if (roomSort == RoomSort.ByPrice) {
        Comparator<RoomModel> priceComparator =
            (a, b) => b.roomPrice.compareTo(a.roomPrice);
        roomList.sort(priceComparator);
        return roomList;
      } else if (roomSort == RoomSort.ByRating) {
        Comparator<RoomModel> ratingComp =
            (a, b) => b.roomPrice.compareTo(a.roomPrice);
        roomList.sort(ratingComp);
        return roomList;
      } else if (roomSort == RoomSort.ByAmentities) {
        Comparator<RoomModel> amentitiesComp = (a, b) => b
            .roomAmenitiesImages.length
            .compareTo(a.roomAmenitiesImages.length);
        roomList.sort(amentitiesComp);
        return roomList;
      }
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
