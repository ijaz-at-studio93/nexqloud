// lib/widgets/counter_display.dart

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:nexqloud/features/main/providers/counter_provider.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counterValue = context.watch<CounterProvider>().counterValue;

    return Text(
      'Counter: $counterValue',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
