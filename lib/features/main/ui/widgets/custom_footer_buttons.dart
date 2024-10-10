import 'package:flutter/cupertino.dart';
import 'package:nexqloud/core/constants/colors.dart';
import 'package:nexqloud/core/extensions/theme_ext.dart';

class CustomFooterButtons extends StatelessWidget {
  const CustomFooterButtons({
    required this.title,
    required this.buttons,
    required this.onTapFunctions,
    Key? key,
  })  : assert(buttons.length == onTapFunctions.length,
            'Buttons and onTapFunctions must have the same length'),
        super(key: key);
  final String title;
  final List<String> buttons;
  final List<VoidCallback> onTapFunctions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.medium?.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        ...List.generate(buttons.length, (index) {
          return Column(
            children: [
              CupertinoButton(
                onPressed: onTapFunctions[index],
                padding: EdgeInsets.zero,
                minSize: 0,
                child: Text(
                  buttons[index],
                  style: context.normal
                      ?.copyWith(fontSize: 16, color: kFooterButtonColor),
                ),
              ),
              const SizedBox(height: 25),
            ],
          );
        }),
      ],
    );
  }
}
