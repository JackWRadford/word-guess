import 'package:flutter/material.dart';
import 'package:word_guess/core/enumerations/char_tile_state.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

/// tile for a char of the keyboard
/// has a char and state of that char
class KeyTile extends StatelessWidget {
  final String char;
  final CharTileState ctState;
  const KeyTile({Key? key, required this.char, required this.ctState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: veryTinyPadding, vertical: tinyPadding),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tinyRadius)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(smallPadding),
            child: Text(
              char,
              style: textHeadline,
            ),
          ),
        ),
      ),
    );
  }
}
