import 'package:flutter/material.dart';
import 'package:metroom/core/service/auth.service.dart';

class AuthNotifer extends ChangeNotifier {
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
}
