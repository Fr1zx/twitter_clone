import 'package:flutter/material.dart';
import 'package:frizter/app/di/di.dart';
import 'package:go_router/go_router.dart';

class RouteObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    _log(route, 'push');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _log(route, 'pop');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _log(newRoute, 'replace');
  }

  void _log(Route? route, String action) {
    if (route is RouteMatch) {}
  }
}
