import 'package:flutter/material.dart';
import 'package:word_guess/core/enumerations/char_tile_state.dart';
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(smallRadius)),
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
