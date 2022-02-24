import 'package:flutter/material.dart';
import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/ui/helper/helper_functions.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';

/// shows a char input and its state
class CharTile extends StatelessWidget {
  final String? char;
  final CharTileState ctState;

  const CharTile({
    Key? key,
    required this.char,
    required this.ctState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getColorForState(context, ctState),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(smallRadius)),
        side: (ctState == CharTileState.selected)
            ? const BorderSide(width: 3, color: myGrey)
            : const BorderSide(width: 0.3, color: Colors.transparent),
      ),
      child: Center(
        child: Text(
          (char != null) ? char!.toUpperCase() : '',
          style: textTitle1,
        ),
      ),
    );
  }
}
