import 'package:deniz_lib/src/router/page_not_found.dart';
import 'package:flutter/material.dart';

class Router {
  final Map<String, Widget> routes;
  final Widget pageNotFound;
  final int initialIndex;

  const Router({
    required this.routes,
    this.initialIndex = 0,
    this.pageNotFound = const PageNotFound(),
  }) : assert(initialIndex <= routes.length);

  String get initialRoute => routes[initialIndex]?.key.toString() ?? '/';

  Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => routes[routeSettings.name] ?? pageNotFound,
    );
  }
}
