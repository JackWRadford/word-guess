import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_text_styles.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/game/game_area.dart';
import 'package:word_guess/ui/widgets/shared/my_custom_alert_dialog.dart';
import 'package:word_guess/ui/widgets/shared/my_dialog_text_btn.dart';

/// dialog for showing game results
class EndGameDialog extends StatelessWidget {
  const EndGameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameModel gameModel = Provider.of<GameModel>(context);
    return MyCustomAlertDialog(
      title: (gameModel.correctGuess) ? 'Congratulations' : 'Unlucky',
      mainContent: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'The word was ',
                style: textHeadline,
              ),
              Text(
                gameModel.currentWord.toUpperCase(),
                style: textHeadline.copyWith(color: myGreen),
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: smallPadding),
              child: GameArea(
                guessData: Provider.of<GameModel>(context).charData,
              ),
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          MyDialogTextBtn(
            text: 'Play again',
            onTap: () {
              Provider.of<GameModel>(context, listen: false).resetGame();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
