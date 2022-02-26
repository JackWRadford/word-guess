import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

///my custom app alertDialog
class MyCustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget mainContent;
  final bool hasClose;

  const MyCustomAlertDialog({
    Key? key,
    required this.title,
    required this.mainContent,
    required this.hasClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          largeRadius,
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (hasClose)
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => {},
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.transparent,
                  ),
                )
              : Container(),
          Text(
            title,
            style: textTitle2,
            textAlign: TextAlign.center,
          ),
          (hasClose)
              ? GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: myGrey,
                  ),
                )
              : Container(),
        ],
      ),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mainContent,
          ],
        ),
      ),
    );
  }
}
