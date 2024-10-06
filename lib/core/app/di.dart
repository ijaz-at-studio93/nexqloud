import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:nexqloud/features/main/providers/counter_provider.dart';

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
        ChangeNotifierProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
      ],
      child: child,
    );
  }
}
