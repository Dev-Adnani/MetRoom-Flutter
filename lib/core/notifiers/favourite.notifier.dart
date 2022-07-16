import 'package:flutter/material.dart';
import 'package:metroom/core/models/favourite.model.dart';
import 'package:metroom/core/service/favourite.service.dart';
import 'package:supabase/supabase.dart';

class FavouriteNotifier extends ChangeNotifier {
  String? error;
  final FavoriteService favoriteService = FavoriteService();
  PostgrestResponse? allFavData;

  Future getAllFavourite({required int userId}) async {
    allFavData = await favoriteService.getAllFavourite(userId: userId);
    return allFavData!.data
        .map((element) => FavouriteModel.fromJson(element))
        .toList();
  }

  Future<bool> addToFavourite(
      {required int userId, required int room_id}) async {
    var data =
        await favoriteService.addToFavourite(userId: userId, room_id: room_id);
    if (data.hasError) {
      error = data.error!.message;
      return false;
    } else {
      return true;
    }
  }

  Future<bool> deleteFromFavourite({
    required int favouriteId,
  }) async {
    var data =
        await favoriteService.deleteFromFavourite(favouriteId: favouriteId);
    if (data.hasError) {
      error = data.error!.message;
      notifyListeners();
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }
}
