import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/ui/widgets/custom_footer_buttons.dart';
import 'package:nexqloud/features/main/ui/widgets/data_analysis_gauges.dart';
import 'package:nexqloud/features/main/ui/widgets/devices_map.dart';
import 'package:nexqloud/features/main/ui/widgets/main_app_bar.dart';
import 'package:nexqloud/features/main/utils/url_launcher_class.dart';

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
                          style: context.medium?.copyWith(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                        const Space.vertical(18),
                        Text(
                          'Start earning, saving, and innovating with our\ncollaborative ecosystem today.',
                          style: context.normal
                              ?.copyWith(fontSize: 18, height: 1.5),
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
                  const Space.vertical(64),

                  ///Footer Area
                  SizedBox(
                    height: 396,
                    width: context.width * 0.7,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/svg/nex_logo.svg',
                                  height: 33,
                                ),
                                const Space.vertical(25),
                                Text(
                                  'Inclusive. Innovative. Indispensable.',
                                  style: context.normal?.copyWith(
                                      fontSize: 17, color: kFooterButtonColor),
                                  textAlign: TextAlign.center,
                                ),
                                const Space.vertical(25),
                                Text(
                                  'info@nexqloud.io\nJoin our Slack community',
                                  style: context.normal?.copyWith(
                                      fontSize: 17, color: kFooterButtonColor),
                                ),
                              ],
                            ),

                            ///Product
                            CustomFooterButtons(
                              title: 'Product',
                              buttons: const [
                                'Overview',
                                'Solutions',
                                'Features',
                                'Q & A',
                              ],
                              onTapFunctions: [
                                () => UrlLauncher.openViewName('#overview'),
                                () =>
                                    UrlLauncher.openViewName('#built-for-all'),
                                () => UrlLauncher.openViewName('#features'),
                                () => UrlLauncher.openViewName('faqs'),
                              ],
                            ),

                            ///Company
                            CustomFooterButtons(
                              title: 'Product',
                              buttons: const [
                                'About',
                                'Customers',
                                'Testimonials',
                                'Partners',
                              ],
                              onTapFunctions: [
                                () => UrlLauncher.openViewName(
                                    'hardware-contributers'),
                                () =>
                                    UrlLauncher.openViewName('cloud-computing'),
                                () => UrlLauncher.openViewName('#testimonials'),
                                () => UrlLauncher.openViewName(
                                    'strategic-partners'),
                              ],
                            ),

                            ///Resources
                            CustomFooterButtons(
                              title: 'Resources',
                              buttons: const [
                                'Terms',
                                'Privacy',
                                'Contact',
                                'Support',
                              ],
                              onTapFunctions: [
                                () => UrlLauncher.openViewName(
                                    'terms-of-service'),
                                () =>
                                    UrlLauncher.openViewName('privacy-policy'),
                                () => UrlLauncher.openViewName('contact'),
                                () => UrlLauncher.openViewName(
                                    'hardware-contributers#'),
                              ],
                            ),

                            ///Use Cases
                            CustomFooterButtons(
                              title: 'Use Cases',
                              buttons: const [
                                'SaaS',
                                'BlockChain',
                                'Gaming',
                                'AI Learning',
                              ],
                              onTapFunctions: [
                                () => UrlLauncher.openViewName(
                                    '?case-study=saas#use-cases'),
                                () => UrlLauncher.openViewName(
                                    '?case-study=blockchain#use-cases'),
                                () => UrlLauncher.openViewName(
                                    '?case-study=gaming#use-cases'),
                                () => UrlLauncher.openViewName(
                                    '?case-study=ai-learning#use-cases'),
                              ],
                            ),

                            ///Social Media
                            CustomFooterButtons(
                              title: 'Social Media',
                              buttons: const [
                                'Facebook',
                                'Twitter',
                                'Instagram',
                                'Telegram',
                              ],
                              onTapFunctions: [
                                () => UrlLauncher.openUrl(
                                    'https://www.facebook.com/nexqloud'),
                                () => UrlLauncher.openUrl(
                                    'https://twitter.com/nexqloud_io'),
                                () => UrlLauncher.openUrl(
                                    'https://www.instagram.com/nexqloud'),
                                () => UrlLauncher.openUrl(
                                    'https://www.linkedin.com/company/nexqloud-io'),
                              ],
                            ),

                            ///Developers
                            CustomFooterButtons(
                              title: 'Developers',
                              buttons: const [
                                'Documentation',
                                'Request Access',
                                'API Reference',
                                'GitHub',
                              ],
                              onTapFunctions: [
                                () => UrlLauncher.openViewName(
                                    'hardware-contributers?case-study=ai-learning#'),
                                () => UrlLauncher.openViewName(
                                    'hardware-contributers?case-study=ai-learning#'),
                                () => UrlLauncher.openViewName(
                                    'hardware-contributers?case-study=ai-learning#'),
                                () => UrlLauncher.openViewName(
                                    'hardware-contributers?case-study=ai-learning#'),
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
