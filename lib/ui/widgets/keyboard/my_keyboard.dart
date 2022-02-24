import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/enums/submit_state.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/game/end_game_dialog.dart';
import 'package:word_guess/ui/widgets/keyboard/key_row.dart';
import 'package:word_guess/ui/widgets/keyboard/keyboard_btn.dart';

/// for user input. also shows state of letters
/// includes chars, backspace and submit word
class MyKeyboard extends StatelessWidget {
  const MyKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        KeyRow(rowData: Provider.of<GameModel>(context).k1),
        KeyRow(rowData: Provider.of<GameModel>(context).k2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeyboardBtn(
              iconData: CupertinoIcons.arrow_turn_down_left,
              color: myGreen,
              onTap: () {
                SubmitState submitState =
                    Provider.of<GameModel>(context, listen: false).submit();
                if ((submitState == SubmitState.correct) ||
                    (submitState == SubmitState.last)) {
                  showDialog(
                    context: context,
                    builder: (ctx) => const EndGameDialog(),
                  );
                } else if (submitState == SubmitState.notWord) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
            UIHelper.horizontalSpaceVerySmall(),
            KeyRow(rowData: Provider.of<GameModel>(context).k3),
            UIHelper.horizontalSpaceVerySmall(),
            KeyboardBtn(
              iconData: CupertinoIcons.delete_left,
              color: myGrey,
              onTap: () {
                Provider.of<GameModel>(context, listen: false).backspace();
              },
            ),
          ],
        ),
      ],
    );
  }
}

const snackBar = SnackBar(
  content: Text(
    'Not a word, or not in our dictionary',
    style: textHeadline,
  ),
  duration: Duration(seconds: 1),
);
