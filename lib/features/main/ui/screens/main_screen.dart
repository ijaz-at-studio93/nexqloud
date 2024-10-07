import 'package:flutter/material.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/features/main/ui/widgets/counter_controls.dart';
import 'package:nexqloud/features/main/ui/widgets/counter_display.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0D0B3E),
                  Color(0xFF5B2D82),
                  Color(0xFF2B0034),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CounterDisplay(),
                SizedBox(height: 20),
                CounterControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
