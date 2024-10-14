import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/extensions/size_ext.dart';
import 'package:nexqloud/core/utils/app_text_styles.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton({
    super.key,
    required this.title,
    required this.onTap,
    this.trailing,
    this.isEnable = true,
    this.addShadow = true,
    this.isText20 = false,
    this.isFromWallet = false,
    this.preFix,
    this.hideGlow = false,
  });
  final String title;
  final VoidCallback onTap;
  final Widget? trailing;
  final Widget? preFix;
  final bool isEnable;
  final bool addShadow;
  final bool isText20;
  final bool isFromWallet;
  final bool hideGlow;

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: !hideGlow ? glowColor : null,
      blurRadius: 25,
      offset: const Offset(0, 4),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: context.height * 48 / context.height,
              decoration: isEnable
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: buttonLinearGradient,
                      color: Colors.black.withOpacity(0.8),
                      boxShadow: addShadow
                          ? [
                              BoxShadow(
                                inset: true,
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(4, 5),
                              ),
                            ]
                          : [],
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: linearGradient,
                      color: Colors.black.withOpacity(0.5),
                      boxShadow: isFromWallet
                          ? [
                              BoxShadow(
                                inset: true,
                                color: Colors.white.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(4, 5),
                              ),
                            ]
                          : [],
                    ),
              child: ElevatedButton(
                onPressed: isEnable ? onTap : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(right: 12),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    if (preFix != null) preFix!,
                    if (trailing != null)
                      const SizedBox(
                        width: 32,
                      ),
                    Text(
                      title,
                      style: AppTextStyles.semiBold.copyWith(
                        color: isEnable ? kWhite : kWhite.withOpacity(0.5),
                      ),
                    ),
                    if (trailing != null) trailing!,
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
