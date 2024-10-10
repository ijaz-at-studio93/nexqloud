import 'package:flutter/cupertino.dart';

import 'package:flutter_svg/svg.dart';

import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/constants/space.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';
import 'package:nexqloud/features/main/ui/widgets/custom_footer_buttons.dart';
import 'package:nexqloud/features/main/utils/url_launcher_class.dart';

class FooterArea extends StatelessWidget {
  const FooterArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    style: context.normal
                        ?.copyWith(fontSize: 17, color: kFooterButtonColor),
                    textAlign: TextAlign.center,
                  ),
                  const Space.vertical(25),
                  Text(
                    'info@nexqloud.io\nJoin our Slack community',
                    style: context.normal
                        ?.copyWith(fontSize: 17, color: kFooterButtonColor),
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
                  () => UrlLauncher.openViewName('#built-for-all'),
                  () => UrlLauncher.openViewName('#features'),
                  () => UrlLauncher.openViewName('#faqs'),
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
                        '?case-study=blockchain#use-cases',
                      ),
                  () =>
                      UrlLauncher.openViewName('?case-study=gaming#use-cases'),
                  () => UrlLauncher.openViewName(
                        '?case-study=ai-learning#use-cases',
                      ),
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
                        'https://www.linkedin.com/company/nexqloud-io',
                      ),
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
                        'hardware-contributers?case-study=ai-learning#',
                      ),
                  () => UrlLauncher.openViewName(
                        'hardware-contributers?case-study=ai-learning#',
                      ),
                  () => UrlLauncher.openViewName(
                        'hardware-contributers?case-study=ai-learning#',
                      ),
                  () => UrlLauncher.openViewName(
                        'hardware-contributers?case-study=ai-learning#',
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
    );
  }
}
