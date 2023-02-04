import 'package:deniz_lib/src/router/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Router {
  final Map<String, Widget> routes;
  final Widget pageNotFound;
  final int initialIndex;

  /// Try this or transition *[Not Both]*
  /// for all the screens
  final PageTransitionType? pageTransitionType;

  /// Try this or pageTransitionType *[Not Both]*
  /// by the up sort you choose for the screens
  final List<PageTransitionType>? transitions;

  const Router({
    required this.routes,
    this.initialIndex = 0,
    this.pageNotFound = const PageNotFound(),
    this.pageTransitionType,
    this.transitions,
  })  : assert(initialIndex <= routes.length),
        assert(
          (pageTransitionType == null)
              ? transitions != null
              // ignore: unnecessary_null_comparison
              : pageTransitionType != null,
        );

  String get initialRoute => routes[initialIndex]?.key.toString() ?? '/';

  Route onGenerateRoute(RouteSettings routeSettings) {
    Widget pageRoute = routes[routeSettings.name] ?? pageNotFound;
    if (pageTransitionType != null) {
      return PageTransition(
        child: pageRoute,
        type: pageTransitionType!,
      );
    } else if (transitions != null) {
      int index = 0;
      routes.forEach((key, value) {
        if (value == pageRoute) {
          return;
        } else {
          index++;
        }
      });
      return PageTransition(child: pageRoute, type: transitions![index]);
    } else {
      return MaterialPageRoute(
        builder: (context) => pageRoute,
      );
    }
  }
}
