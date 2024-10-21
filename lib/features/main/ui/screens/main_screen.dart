import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/ui/views/footer_area.dart';
import 'package:nexqloud/features/main/ui/widgets/data_analysis_gauges.dart';
import 'package:nexqloud/features/main/ui/widgets/data_grid.dart';
import 'package:nexqloud/features/main/ui/widgets/main_app_bar.dart';
import 'package:nexqloud/features/main/ui/widgets/world_map.dart';
import 'package:nexqloud/features/main/utils/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isMenuVisible = false; // Controls the visibility of the menu
  final double _menuMaxHeight = 300; // Max height for the menu

  // Toggles the menu's visibility
  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
      _isMenuVisible ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        color: _isMenuVisible ? kBackgroundColor : kTransparent,
                        child: MainAppBar(
                          controller: _controller,
                          toggleMenu: _toggleMenu,
                        ),
                      ),
                      const WorldMap(),
                      const DataAnalysisGauges(),
                      SizedBox(
                        height: context.isMobile
                            ? context.height * 1.15
                            : context.height * 0.75,
                        width: context.width * 0.9,
                        child: TransparentDataGrid(),
                      ),
                      const Space.vertical(40),
                      Container(
                        height: 480,
                        width: context.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
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
                              "POWER TOMORROW'S CLOUD\nTODAY WITH NEXQLOUD",
                              style: context.medium?.copyWith(
                                fontSize: context.isMobile ? 24 : 40,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Space.vertical(18),
                            Text(
                              'Start earning, saving, and innovating with our\ncollaborative ecosystem today.',
                              style: context.normal?.copyWith(
                                fontSize: context.isMobile ? 15 : 18,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Space.vertical(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppStoreIcon(
                                  assetPath:
                                      'assets/icons/svg/apple_icon_white.svg',
                                  onTap: () => UrlLauncher.openUrl(
                                    'https://apps.apple.com/us/app/nexqloud-app/id6499353452',
                                  ),
                                ),
                                const Space.horizontal(10),
                                AppStoreIcon(
                                  assetPath:
                                      'assets/icons/svg/google_play_icon_white.svg',
                                  onTap: () => UrlLauncher.openUrl(
                                    'https://play.google.com/store/apps/details?id=com.nexqloud.providerapp.prod',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Space.vertical(64),

                      ///Footer Area
                      const FooterArea(),
                      const Space.vertical(34),
                    ],
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    top: _isMenuVisible ? kToolbarHeight : -_menuMaxHeight,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: _menuMaxHeight,
                      color: kBackgroundColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MenuItem(text: 'Link Device'),
                          MenuItem(text: 'Elastic Computing'),
                          MenuItem(text: 'Web Hosting'),
                          MenuItem(text: 'Partners'),
                          MenuItem(text: 'FAQs'),
                        ],
                      ),
                    ),
                  ),
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
    this.onTap,
  });
  final String assetPath;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      minSize: 0,
      child: Container(
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
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
