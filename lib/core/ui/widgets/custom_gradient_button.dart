import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/utils/app_text_styles.dart';

class CustomGradientButton extends StatelessWidget {
  const CustomGradientButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.trailing,
      this.isEnable,
      this.addShadow,
      this.isText20,
      this.isFromWallet});
  final String title;
  final Function()? onTap;
  final Widget? trailing;
  final bool? isEnable;
  final bool? addShadow;
  final bool? isText20;
  final bool? isFromWallet;
  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: isEnable != false
          ? glowColor
          : isFromWallet == true
              ? glowColor
              : null,
      blurRadius: 25,
      offset: const Offset(0, 4),
      child: Stack(
        children: [
          Center(
            child: Container(
                // width: MediaQuery.of(context).size.width *
                //     238 /
                //     MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *
                    48 /
                    MediaQuery.of(context).size.height,
                decoration: isEnable == true
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: buttonLinearGradient,
                        color: Colors.black.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            inset: true,
                            color: Colors.white.withOpacity(0.5),
                            // color: Color.fromRGBO(180, 186, 194, 0.9),
                            blurRadius: 10, //extend the shadow
                            offset: Offset(4, 5),
                          ),
                        ],
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: linearGradient,
                        color: Colors.black.withOpacity(0.5),
                        boxShadow: isEnable == true
                            ? [
                                BoxShadow(
                                  inset: true,
                                  color: Colors.white.withOpacity(0.5),
                                  // color: Color.fromRGBO(180, 186, 194, 0.9),
                                  blurRadius: 5, //extend the shadow
                                  offset: Offset(5, 2),
                                ),
                              ]
                            : isFromWallet == true
                                ? [
                                    BoxShadow(
                                      inset: true,
                                      color: Colors.white.withOpacity(0.5),
                                      // color: Color.fromRGBO(180, 186, 194, 0.9),
                                      blurRadius: 10, //extend the shadow
                                      offset: Offset(4, 5),
                                    ),
                                  ]
                                : [],
                      ),
                child: ElevatedButton(
                  onPressed: isEnable == false ? null : onTap,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(right: 12),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      if (trailing != null)
                        const SizedBox(
                          width: 32,
                        ),
                      Text(title,
                          style: isText20 ?? false
                              ? AppTextStyles.semiBold.copyWith(
                                  color: isEnable == false
                                      ? kWhite.withOpacity(0.5)
                                      : kWhite,
                                )
                              : AppTextStyles.semiBold.copyWith(
                                  color: isEnable == false
                                      ? kWhite.withOpacity(0.5)
                                      : kWhite,
                                )),
                      const Spacer(),

                      if (trailing != null) trailing!,
                      // SizedBox(width: 4)
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
