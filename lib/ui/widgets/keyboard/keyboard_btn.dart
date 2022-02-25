import 'package:flutter/material.dart';
import 'package:word_guess/ui/helper/helper_functions.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

/// button for other keyboard actions (backspace and submit)
class KeyboardBtn extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final Function() onTap;
  const KeyboardBtn({
    Key? key,
    required this.iconData,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = calcKeyWidth(MediaQuery.of(context).size.width);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: w * 1.2,
        height: w * 1.3,
        child: Card(
          color: color,
          margin: const EdgeInsets.symmetric(
              horizontal: veryTinyPadding, vertical: tinyPadding),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(tinyRadius)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(smallPadding),
              child: Icon(
                iconData,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
