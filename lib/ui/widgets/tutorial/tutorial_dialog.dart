import 'package:flutter/material.dart';
import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/game/char_tile.dart';
import 'package:word_guess/ui/widgets/shared/my_custom_alert_dialog.dart';
import 'package:word_guess/ui/widgets/shared/my_divider.dart';

/// shows user how to play (display on first open or info button)
class TutorialDialog extends StatelessWidget {
  const TutorialDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomAlertDialog(
      title: 'How to play',
      mainContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '\u2022 You have 6 attempts to guess the hidden word',
            style: textBody,
          ),
          UIHelper.verticalSpaceSmall(),
          const Text(
            '\u2022 Press the green button to submit',
            style: textBody,
          ),
          UIHelper.verticalSpaceMedium(),
          const MyDivider(indent: 0),
          UIHelper.verticalSpaceMedium(),
          const Text(
            'Example attempt',
            style: textHeadline,
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _getExmapleTile('q', CharTileState.correct),
              _getExmapleTile('u', CharTileState.incorrect),
              _getExmapleTile('i', CharTileState.exists),
              _getExmapleTile('t', CharTileState.incorrect),
              _getExmapleTile('e', CharTileState.incorrect),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
          const Text(
            '\u2022 Q is in the hidden word and exists in that position',
            style: textBody,
          ),
          UIHelper.verticalSpaceSmall(),
          const Text(
            '\u2022 I is in the hidden word, but not in that position',
            style: textBody,
          ),
          UIHelper.verticalSpaceSmall(),
          const Text(
            '\u2022 U,T and E are not in the hidden word',
            style: textBody,
          ),
        ],
      ),
    );
  }

  Widget _getExmapleTile(String char, CharTileState ctState) {
    return SizedBox(
        width: 45, height: 45, child: CharTile(char: char, ctState: ctState));
  }
}
