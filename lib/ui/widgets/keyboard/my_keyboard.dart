import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/keyboard/key_row.dart';
import 'package:word_guess/ui/widgets/keyboard/keyboard_btn.dart';

/// for user input. also shows state of letters
/// includes chars, backspace and submit word
class MyKeyboard extends StatelessWidget {
  const MyKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CharModel> k1 = [
      CharModel(char: 'q'),
      CharModel(char: 'w'),
      CharModel(char: 'e'),
      CharModel(char: 'r'),
      CharModel(char: 't'),
      CharModel(char: 'y'),
      CharModel(char: 'u'),
      CharModel(char: 'i'),
      CharModel(char: 'o'),
      CharModel(char: 'p'),
    ];
    List<CharModel> k2 = [
      CharModel(char: 'a'),
      CharModel(char: 's'),
      CharModel(char: 'd'),
      CharModel(char: 'f'),
      CharModel(char: 'g'),
      CharModel(char: 'h'),
      CharModel(char: 'j'),
      CharModel(char: 'k'),
      CharModel(char: 'l'),
    ];
    List<CharModel> k3 = [
      CharModel(char: 'z'),
      CharModel(char: 'x'),
      CharModel(char: 'c'),
      CharModel(char: 'v'),
      CharModel(char: 'b'),
      CharModel(char: 'n'),
      CharModel(char: 'm'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        KeyRow(rowData: k1),
        KeyRow(rowData: k2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeyboardBtn(
              iconData: CupertinoIcons.arrow_turn_down_left,
              color: CupertinoColors.activeGreen,
              onTap: () {
                Provider.of<GameModel>(context, listen: false).submit();
              },
            ),
            UIHelper.horizontalSpaceVerySmall(),
            KeyRow(rowData: k3),
            UIHelper.horizontalSpaceVerySmall(),
            KeyboardBtn(
              iconData: CupertinoIcons.delete_left,
              color: CupertinoColors.systemGrey,
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
