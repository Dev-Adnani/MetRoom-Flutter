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
  int? userId;
  String? userName;
  String? userPhoto;
  String? userEmail;
  String? userPhoneNo;

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
          userId = dataAdded.data[0]['user_id'];
          getUserDataByID(user_id: userId!);
          CacheService.setInt(
            key: AppKeys.userData,
            value: userId!,
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
        var userData = await getUserDataByEmail(useremail: email);
        if (userData!.hasError) {
          error = userData.error!.message.toString();
          return false;
        } else {
          userId = userData.data[0]['user_id'];
          getUserDataByID(user_id: userId!);

          CacheService.setInt(
            key: AppKeys.userData,
            value: userId!,
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

  Future<PostgrestResponse?> getUserDataByEmail(
      {required String useremail}) async {
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

  Future getUserDataByID({required int user_id}) async {
    try {
      PostgrestResponse response = await SupabaseAPI.supabaseClient
          .from("users")
          .select()
          .eq("user_id", user_id)
          .execute();

      if (response.hasError) {
        await CacheService.deleteKey(key: AppKeys.userData);
      } else {
        var data = response.data;
        userId = data[0]['user_id'];
        userEmail = data[0]['user_email'];
        userPhoto = data[0]['user_profile_url'];
        userName = data[0]['user_name'];
        userPhoneNo = data[0]['user_phone_no'];
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<bool> updateUserData({
    required String useremail,
    required String username,
    required String userMobileNo,
    required String userPhoto,
  }) async {
    final isUpdated = await _authenticationService.updateUserData(
      useremail: useremail,
      username: username,
      userMobileNo: userMobileNo,
      userPhoto: userPhoto,
    );

    if (isUpdated.hasError) {
      error = isUpdated.error!.message;
      return false;
    } else {
      print(isUpdated.data);
      getUserDataByID(user_id: userId!);
      return true;
    }
  }
}
