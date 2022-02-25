import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/ui/helper/helper_functions.dart';
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Provider.of<GameModel>(context, listen: false).keyboardInput(char);
      },
      child: SizedBox(
        width: calcKeyWidth(MediaQuery.of(context).size.width), //35
        child: Card(
          color: getColorForState(context, ctState),
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
      ),
    );
  }
}
