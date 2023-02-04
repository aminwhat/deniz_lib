import 'package:deniz_lib/src/router/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Router {
  final Map<String, Widget> routes;
  final Widget pageNotFound;
  final int initialIndex;
  final PageTransitionType? pageTransitionType;

  const Router({
    required this.routes,
    this.initialIndex = 0,
    this.pageNotFound = const PageNotFound(),
    this.pageTransitionType,
  }) : assert(initialIndex <= routes.length);

  String get initialRoute => routes[initialIndex]?.key.toString() ?? '/';

  Route onGenerateRoute(RouteSettings routeSettings) {
    if (pageTransitionType != null) {
      return PageTransition(
        child: routes[routeSettings.name] ?? pageNotFound,
        type: pageTransitionType!,
      );
    } else {
      return MaterialPageRoute(
          builder: (context) => routes[routeSettings.name] ?? pageNotFound);
    }
  }
}
