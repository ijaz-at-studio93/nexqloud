import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/log.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/core/ui/widgets/blurred_background.dart';
import 'package:nexqloud/core/ui/widgets/custom_gradient_button.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.height * 0.1,
        vertical: 45,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            'assets/icons/svg/nex_logo.svg',
            height: 32,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF4e65b3).withOpacity(0.5),
                    kTransparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(1000),
            ),
            height: 54,
            child: BlurredBackground(
              blurColorFilter: kWhite.withOpacity(0.2),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kTransparent),
                    ),
                    onPressed: null,
                    child: Text(
                      'How it works',
                      style: context.normal?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Space.horizontal(25),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kTransparent),
                    ),
                    onPressed: null,
                    child: Text(
                      'Features',
                      style: context.normal?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Space.horizontal(25),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kTransparent),
                    ),
                    onPressed: null,
                    child: Text(
                      'Platform',
                      style: context.normal?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Space.horizontal(25),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kTransparent),
                    ),
                    onPressed: null,
                    child: Text(
                      'FAQs',
                      style: context.normal?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Space.horizontal(25),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kTransparent),
                    ),
                    onPressed: null,
                    child: Text(
                      'Solution',
                      style: context.normal?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(kTransparent),
                  ),
                  onPressed: null,
                  child: Text(
                    'Sign up',
                    style: context.medium,
                  ),
                ),
                const Space.horizontal(24),
                SizedBox(
                  width: 120,
                  child: CustomGradientButton(
                    title: 'Sign In',
                    onTap: () {
                      'Sign In'.printInfo();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
