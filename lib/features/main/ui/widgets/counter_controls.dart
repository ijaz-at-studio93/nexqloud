// lib/widgets/counter_controls.dart

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:nexqloud/features/main/providers/counter_provider.dart';

class CounterControls extends StatelessWidget {
  const CounterControls({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();

    return Column(
      children: [
        ElevatedButton(
          onPressed: () => counterProvider.increment(),
          child: const Text('Increment'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => counterProvider.reset(),
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
