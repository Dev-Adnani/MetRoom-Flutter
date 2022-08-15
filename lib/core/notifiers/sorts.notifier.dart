import 'package:flutter/material.dart';

enum RoomSort { ByPrice, ByRating, ByAmentities, Normal }
enum SortingSystem { ByAscendingOrder, ByDescendingOrder }

class SortNotifier extends ChangeNotifier {
  SortingSystem sortBySys = SortingSystem.ByAscendingOrder;
  RoomSort roomSort = RoomSort.Normal;

  void changeByAscendingOrder() {
    sortBySys = SortingSystem.ByAscendingOrder;
    notifyListeners();
  }

  void changeByDescendingOrder() {
    sortBySys = SortingSystem.ByDescendingOrder;
    notifyListeners();
  }

  void changeByPrice() {
    roomSort = RoomSort.ByPrice;
    notifyListeners();
  }

  void changeByRating() {
    roomSort = RoomSort.ByRating;
    notifyListeners();
  }

  void changeByAmentities() {
    roomSort = RoomSort.ByAmentities;
    notifyListeners();
  }

  void changeNormal() {
    roomSort = RoomSort.Normal;
    notifyListeners();
  }
}
