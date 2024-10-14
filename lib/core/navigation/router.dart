import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:nexqloud/core/navigation/app_route.dart';
import 'package:nexqloud/core/observers/app_navigation_observer.dart';
import 'package:nexqloud/features/main/ui/screens/main_screen.dart';
import 'package:nexqloud/features/main/ui/widgets/continent_map.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoute.main.path,
  restorationScopeId: 'root',
  navigatorKey: navigatorKey,
  observers: <NavigatorObserver>[
    AppNavigationObserver(),
  ],
  routes: <GoRoute>[
    GoRoute(
      path: AppRoute.main.path,
      builder: (context, state) => const MainScreen(),
    ),
    // GoRoute(
    //   path: AppRoute.map.path,
    //   builder: (context, state) => const ContinentMap(index: 0,),
    // ),
  ],
);
