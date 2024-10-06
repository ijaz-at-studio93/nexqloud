import 'package:flutter/material.dart';

import 'package:nexqloud/core/app/app_theme.dart';
import 'package:nexqloud/core/app/di.dart';
import 'package:nexqloud/core/navigation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Di(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        routerConfig: router,
      ),
    );
  }
}
