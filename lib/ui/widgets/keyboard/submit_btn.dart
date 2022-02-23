import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

/// button to submit guess if exists
class SubmitBtn extends StatelessWidget {
  const SubmitBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 45,
      child: Card(
        color: CupertinoColors.activeGreen,
        margin: EdgeInsets.symmetric(
            horizontal: veryTinyPadding, vertical: tinyPadding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tinyRadius)),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(smallPadding),
            child: Icon(
              CupertinoIcons.arrow_right,
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
