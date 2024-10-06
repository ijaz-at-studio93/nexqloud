import 'package:flutter/material.dart';

import 'package:nexqloud/core/extensions/log.dart';

class AppNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    'New route pushed: ${route.settings.name}'.printInfo();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    'Route popped: ${route.settings.name}'.printInfo();
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    'Route replaced: ${newRoute?.settings.name}'.printInfo();
  }
}
