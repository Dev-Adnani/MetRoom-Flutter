import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.keys.dart';
import 'package:metroom/core/service/authentication.service.dart';
import 'package:metroom/core/service/cache.service.dart';

class AuthenticationNotifer extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationService.signUp(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationService.login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future logout({
    required String email,
    required String password,
  }) async {
    await CacheService.deleteKey(key: AppKeys.userData);
  }
}
