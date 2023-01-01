import 'package:deniz_lib/src/router/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Router {
  final List<String> routes;
  final List<Widget> screens;
  final Widget pageNotFound;

  late Map<String, Widget> _matchedScreens;

  Router({
    required this.screens,
    required this.routes,
    this.pageNotFound = const PageNotFound(),
  }) {
    if (routes.length != screens.length) {
      throw Exception('Routes does not match screens');
    } else {
      for (var i = 0; i < routes.length; i++) {
        _matchedScreens.assign(routes[i], screens[i]);
      }
    }
  }

  String get initialRoute => routes[0];

  Route onGenerateRoute(RouteSettings routeSettings) {
    return GetPageRoute(
      page: () => _matchedScreens[routeSettings.name] ?? pageNotFound,
    );
  }
}
