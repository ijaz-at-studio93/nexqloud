import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:glassmorphism/glassmorphism.dart';

import 'package:nexqloud/core/app/colors.dart';

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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GlassmorphicContainer(
                  width: 350,
                  height: 350,
                  borderRadius: 30,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 1,
                  linearGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kTransparent,
                      kTransparent,
                    ],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      kWhite,
                      const Color(0xFFFFFFFF).withOpacity(0.2),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                const CounterDisplay(),
                const SizedBox(height: 20),
                const CounterControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
