import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/ui/widgets/custom_footer_buttons.dart';
import 'package:nexqloud/features/main/utils/url_launcher.dart';

class FooterArea extends StatelessWidget {
  const FooterArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.isDesktop
        ? _buildDesktopFooter(context)
        : _buildMobileFooter(context);
  }

  Widget _buildMobileFooter(BuildContext context) {
    return SizedBox(
      width: context.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogoSection(context),
          const Space.vertical(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Product
              SizedBox(
                width: context.width * 0.3,
                child: CustomFooterButtons(
                  title: 'Product',
                  buttons: const [
                    'Overview',
                    'Solutions',
                    'Features',
                    'Q & A',
                  ],
                  onTapFunctions: [
                    () => UrlLauncher.openViewName('#overview'),
                    () => UrlLauncher.openViewName('#built-for-all'),
                    () => UrlLauncher.openViewName('#features'),
                    () => UrlLauncher.openViewName('#faqs'),
                  ],
                ),
              ),
              Space.horizontal(context.width * 0.2),

              ///Company
              CustomFooterButtons(
                title: 'Company',
                buttons: const [
                  'About',
                  'Customers',
                  'Testimonials',
                  'Partners',
                ],
                onTapFunctions: [
                  () => UrlLauncher.openViewName('hardware-contributers'),
                  () => UrlLauncher.openViewName('cloud-computing'),
                  () => UrlLauncher.openViewName('#testimonials'),
                  () => UrlLauncher.openViewName('strategic-partners'),
                ],
              ),
            ],
          ),
          const Space.vertical(20),
          Row(
            children: [
              ///Resources
              SizedBox(
                width: context.width * 0.3,
                child: CustomFooterButtons(
                  title: 'Resources',
                  buttons: const [
                    'Terms',
                    'Privacy',
                    'Contact',
                    'Support',
                  ],
                  onTapFunctions: [
                    () => UrlLauncher.openViewName('terms-of-service'),
                    () => UrlLauncher.openViewName('privacy-policy'),
                    () => UrlLauncher.openViewName('contact'),
                    () => UrlLauncher.openViewName('hardware-contributers#'),
                  ],
                ),
              ),
              Space.horizontal(context.width * 0.2),

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
                  () => UrlLauncher.openViewName('?case-study=saas#use-cases'),
                  () => UrlLauncher.openViewName(
                      '?case-study=blockchain#use-cases'),
                  () =>
                      UrlLauncher.openViewName('?case-study=gaming#use-cases'),
                  () => UrlLauncher.openViewName(
                      '?case-study=ai-learning#use-cases'),
                ],
              ),
            ],
          ),
          const Space.vertical(20),
          Row(
            children: [
              ///Social Media
              SizedBox(
                width: context.width * 0.3,
                child: CustomFooterButtons(
                  title: 'Social Media',
                  buttons: const [
                    'Facebook',
                    'Twitter',
                    'Instagram',
                    'LinkedIn',
                  ],
                  onTapFunctions: [
                    () => UrlLauncher.openUrl(
                        'https://www.facebook.com/nexqloud'),
                    () =>
                        UrlLauncher.openUrl('https://twitter.com/nexqloud_io'),
                    () => UrlLauncher.openUrl(
                        'https://www.instagram.com/nexqloud'),
                    () => UrlLauncher.openUrl(
                        'https://www.linkedin.com/company/nexqloud-io'),
                  ],
                ),
              ),
              Space.horizontal(context.width * 0.2),

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
          const Space.vertical(30),
          Divider(
            color: kWhite.withOpacity(0.5),
          ),
          const Space.vertical(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoButton(
                    onPressed: () => UrlLauncher.openViewName('privacy-policy'),
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Text(
                      'Privacy Policy',
                      style: context.normal
                          ?.copyWith(fontSize: 16, color: kFooterButtonColor),
                    ),
                  ),
                  const Space.horizontal(18),
                  CupertinoButton(
                    onPressed: () =>
                        UrlLauncher.openViewName('terms-of-service'),
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    child: Text(
                      'Terms and Conditions',
                      style: context.normal
                          ?.copyWith(fontSize: 16, color: kFooterButtonColor),
                    ),
                  ),
                ],
              ),
              const Space.vertical(10),
              FittedBox(child: _buildCopyrightsTextWidget(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return SizedBox(
      width: context.width * 0.83,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogoSection(context),

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
                  () => UrlLauncher.openViewName('#built-for-all'),
                  () => UrlLauncher.openViewName('#features'),
                  () => UrlLauncher.openViewName('#faqs'),
                ],
              ),

              ///Company
              CustomFooterButtons(
                title: 'Company',
                buttons: const [
                  'About',
                  'Customers',
                  'Testimonials',
                  'Partners',
                ],
                onTapFunctions: [
                  () => UrlLauncher.openViewName('hardware-contributers'),
                  () => UrlLauncher.openViewName('cloud-computing'),
                  () => UrlLauncher.openViewName('#testimonials'),
                  () => UrlLauncher.openViewName('strategic-partners'),
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
                  () => UrlLauncher.openViewName('terms-of-service'),
                  () => UrlLauncher.openViewName('privacy-policy'),
                  () => UrlLauncher.openViewName('contact'),
                  () => UrlLauncher.openViewName('hardware-contributers#'),
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
                  () => UrlLauncher.openViewName('?case-study=saas#use-cases'),
                  () => UrlLauncher.openViewName(
                      '?case-study=blockchain#use-cases'),
                  () =>
                      UrlLauncher.openViewName('?case-study=gaming#use-cases'),
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
                  'LinkedIn',
                ],
                onTapFunctions: [
                  () =>
                      UrlLauncher.openUrl('https://www.facebook.com/nexqloud'),
                  () => UrlLauncher.openUrl('https://twitter.com/nexqloud_io'),
                  () =>
                      UrlLauncher.openUrl('https://www.instagram.com/nexqloud'),
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
          const Space.vertical(30),
          Divider(
            color: kWhite.withOpacity(0.5),
          ),
          const Space.vertical(20),
          Row(
            children: [
              _buildCopyrightsTextWidget(context),
              const Spacer(),
              CupertinoButton(
                onPressed: () => UrlLauncher.openViewName('privacy-policy'),
                padding: EdgeInsets.zero,
                minSize: 0,
                child: Text(
                  'Privacy Policy',
                  style: context.normal
                      ?.copyWith(fontSize: 16, color: kFooterButtonColor),
                ),
              ),
              const Space.horizontal(18),
              CupertinoButton(
                onPressed: () => UrlLauncher.openViewName('terms-of-service'),
                padding: EdgeInsets.zero,
                minSize: 0,
                child: Text(
                  'Terms and Conditions',
                  style: context.normal
                      ?.copyWith(fontSize: 16, color: kFooterButtonColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildLogoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/icons/svg/nex_logo.svg',
          height: 33,
        ),
        const Space.vertical(25),
        Text(
          'Inclusive. Innovative. Indispensable.',
          style:
              context.normal?.copyWith(fontSize: 17, color: kFooterButtonColor),
          textAlign: TextAlign.center,
        ),
        const Space.vertical(25),
        Text(
          'info@nexqloud.io\nJoin our Slack community',
          style:
              context.normal?.copyWith(fontSize: 17, color: kFooterButtonColor),
        ),
      ],
    );
  }

  Row _buildCopyrightsTextWidget(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '© Copyright 2024 ',
                style: context.normal
                    ?.copyWith(fontSize: 16, color: kFooterButtonColor),
              ),
              TextSpan(
                text: 'NexQloud.',
                style: context.bold?.copyWith(fontSize: 16),
              ),
              TextSpan(
                text: ' All Rights Reserved.',
                style: context.normal
                    ?.copyWith(fontSize: 16, color: kFooterButtonColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
