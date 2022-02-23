import 'package:flutter/material.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

///my custom app alertDialog
class MyCustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget mainContent;

  const MyCustomAlertDialog({
    Key? key,
    required this.title,
    required this.mainContent,
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
      title: Center(
        child: Text(
          title,
          style: textHeadline,
          textAlign: TextAlign.center,
        ),
      ),
      content: SizedBox(
        width: 800,
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
