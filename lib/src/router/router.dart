import 'package:deniz_lib/src/router/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Router {
  final List<String> routes;
  final List<Widget> screens;
  final Widget pageNotFound;
  final int initialIndex;

  const Router({
    required this.screens,
    required this.routes,
    this.pageNotFound = const PageNotFound(),
    this.initialIndex = 0,
  })  : assert(initialIndex <= routes.length),
        assert(routes.length == screens.length);

  String get initialRoute => routes[initialIndex];

  Route onGenerateRoute(RouteSettings routeSettings) {
    Map<String, Widget> matchedScreens = {};

    for (var i = 0; i < routes.length; i++) {
      matchedScreens.assign(routes[i], screens[i]);
    }

    return GetPageRoute(
      page: () => matchedScreens[routeSettings.name] ?? pageNotFound,
    );
  }
}
