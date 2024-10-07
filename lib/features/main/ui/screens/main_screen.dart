import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/core/ui/widgets/blurred_background.dart';
import 'package:nexqloud/core/utils/app_text_styles.dart';
import 'package:nexqloud/features/main/ui/widgets/counter_controls.dart';
import 'package:nexqloud/features/main/ui/widgets/counter_display.dart';

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
          Center(
            child: Column(
              children: <Widget>[
                const Space.vertical(45),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.height * 0.1,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/svg/nex_logo.svg',
                        height: 24,
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [kWhite.withOpacity(0.5), kTransparent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        height: 45,
                        child: BlurredBackground(
                          blurColorFilter: kWhite.withOpacity(0.2),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'How it works',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Features',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Platform',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'FAQs',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Space.horizontal(25),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(kTransparent),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Solution',
                                  style: context.normal?.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(kTransparent),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Sign up',
                          style: AppTextStyles.medium,
                        ),
                      ),
                      const Space.horizontal(24),
                      FilledButton(
                        style: const ButtonStyle(),
                        onPressed: () {},
                        child: const Text('Log in'),
                      ),
                    ],
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
