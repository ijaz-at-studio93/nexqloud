import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
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
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const MainAppBar(),
                  const DevicesMap(),
                  const DataAnalysisGauges(),
                  Container(
                    height: 480,
                    width: context.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [
                          gradientColorThree,
                          gradientColorTwo,
                          gradientColorOne,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Power Tomorrow's Cloud\nToday With NexQloud",
                          style: context.bold?.copyWith(fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                        const Space.vertical(18),
                        Text(
                          'Start earning, saving, and innovating with our\ncollaborative ecosystem today.',
                          style: context.normal?.copyWith(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const Space.vertical(20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppStoreIcon(
                              assetPath:
                                  'assets/icons/svg/apple_icon_white.svg',
                            ),
                            Space.horizontal(10),
                            AppStoreIcon(
                              assetPath:
                                  'assets/icons/svg/google_play_icon_white.svg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Space.vertical(54),

                  ///Footer Area
                  SizedBox(
                    height: 396,
                    width: context.width * 0.7,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/svg/nex_logo.svg',
                                  height: 32,
                                ),
                                const Space.vertical(25),
                                Text(
                                  'Inclusive. Innovative. Indispensable.',
                                  style: context.light?.copyWith(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                                const Space.vertical(25),
                                Text(
                                  'info@nexqloud.io\nJoin our Slack community',
                                  style: context.light?.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '© 2022 NexQloud. All Rights Reserved.',
                          style: context.normal?.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const Space.vertical(34),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppStoreIcon extends StatelessWidget {
  const AppStoreIcon({
    super.key,
    required this.assetPath,
  });
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kBlack.withOpacity(0.3), kBlack],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          assetPath,
        ),
      ),
    );
  }
}
