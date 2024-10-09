import 'package:flutter/material.dart';

import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/features/main/ui/widgets/data_analysis_gauges.dart';
import 'package:nexqloud/features/main/ui/widgets/devices_map.dart';
import 'package:nexqloud/features/main/ui/widgets/main_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kBackgroundColor,
            ),
          ),
          Positioned(
            right: -200,
            top: -200,
            child: Image.asset('assets/images/png/top_right.png'),
          ),
          Positioned(
            left: 100,
            top: -300,
            child: Image.asset('assets/images/png/top_right.png'),
          ),
          Positioned(
            left: -500,
            top: 100,
            child: Image.asset('assets/images/png/right.png'),
          ),
          Positioned(
            top: 50,
            right: -100,
            // left: -200,
            child: Image.asset('assets/images/png/left.png'),
          ),
          const Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MainAppBar(),
                  DevicesMap(),
                  DataAnalysisGauges(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
