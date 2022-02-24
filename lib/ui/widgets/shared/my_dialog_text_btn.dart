import 'package:flutter/cupertino.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

///used for dialogs that require actions
class MyDialogTextBtn extends StatelessWidget {
  final String text;
  final Function() onTap;

  const MyDialogTextBtn({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 140,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(
            mediumPadding,
          ),
          decoration: const BoxDecoration(
            color: CupertinoColors.activeGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(mediumRadius),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: textHeadline.copyWith(
                color: CupertinoColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
