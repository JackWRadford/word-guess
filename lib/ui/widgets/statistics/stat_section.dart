import 'package:flutter/material.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';

/// section for a stat label and value
class StatSection extends StatelessWidget {
  final String label;
  final String value;
  const StatSection({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // value
        Text(
          value,
          style: textHeadline,
        ),
        UIHelper.verticalSpaceVerySmall(),
        Text(
          label,
          style: textFootnote.copyWith(color: myGrey),
        ),
      ],
    );
  }
}
