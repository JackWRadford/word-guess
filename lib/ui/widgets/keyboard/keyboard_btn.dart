import 'package:flutter/material.dart';
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: 45,
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
