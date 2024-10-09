import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:nexqloud/features/main/providers/server_data_provider.dart';

class Di extends StatelessWidget {
  const Di({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ServerDataProvider>(
          create: (_) => ServerDataProvider(),
        ),
      ],
      child: child,
    );
  }
}
