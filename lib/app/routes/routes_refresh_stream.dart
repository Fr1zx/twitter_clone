import 'package:flutter/material.dart';
import 'package:frizter/core/services/user_service.dart';

class RoutesRefreshStream extends ChangeNotifier {
  bool isLogined = false;

  RoutesRefreshStream({required IUserService userService}) {
    userService.isLogined().listen((loggedIn) {
      isLogined = loggedIn;
      notifyListeners();
    });
  }
}
