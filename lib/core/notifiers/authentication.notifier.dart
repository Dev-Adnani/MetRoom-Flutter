import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/core/api/supabase.api.dart';
import 'package:metroom/core/models/user.model.dart';
import 'package:metroom/core/service/authentication.service.dart';
import 'package:metroom/core/service/cache.service.dart';
import 'package:supabase/supabase.dart';

class AuthenticationNotifer extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();
  String? error;

  //TODO : Store Important User Data ->
  Future<bool> signUp({
    required UserModel userModel,
  }) async {
    try {
      GotrueSessionResponse response = await _authenticationService.signUp(
        email: userModel.userEmail,
        password: userModel.userPassword,
      );
      if (response.error == null) {
        notifyListeners();
        var dataAdded = await addUserToDatabase(userModel: userModel);
        if (dataAdded!.hasError) {
          error = dataAdded.error!.message;
          notifyListeners();
          return false;
        } else {
          var userId = dataAdded.data[0]['user_id'];
          CacheService.setInt(
            key: AppKeys.userData,
            value: userId,
          );
          return true;
        }
      } else {
        error = response.error!.message.toString();
        notifyListeners();
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      GotrueSessionResponse response =
          await _authenticationService.login(email: email, password: password);
      if (response.error == null) {
        notifyListeners();
        var userData = await getUserData(useremail: email);
        if (userData!.hasError) {
          error = userData.error!.message.toString();
          return false;
        } else {
          print(userData.data);
          var userId = userData.data[0]['user_id'];
          CacheService.setInt(
            key: AppKeys.userData,
            value: userId,
          );
          return true;
        }
      } else {
        error = response.error!.message.toString();
        notifyListeners();
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future logout() async {
    await CacheService.deleteKey(key: AppKeys.userData);
  }

  Future<PostgrestResponse?> addUserToDatabase(
      {required UserModel userModel}) async {
    try {
      PostgrestResponse? response =
          await SupabaseAPI.supabaseClient.from("users").insert({
        "created_at": userModel.createdAt.toString(),
        "user_name": userModel.userName.toString(),
        "user_email": userModel.userEmail.toString(),
        "user_password": userModel.userPassword.toString(),
        "user_phone_no": userModel.userPhoneNo,
      }).execute();
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<PostgrestResponse?> getUserData({required String useremail}) async {
    try {
      PostgrestResponse? response = await SupabaseAPI.supabaseClient
          .from("users")
          .select()
          .eq("user_email", useremail)
          .execute();
      return response;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
