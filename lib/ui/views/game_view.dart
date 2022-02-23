import 'package:flutter/material.dart';
import 'package:word_guess/core/enumerations/char_tile_state.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/game/game_area.dart';
import 'package:word_guess/ui/widgets/keyboard/key_row.dart';
import 'package:word_guess/ui/widgets/keyboard/submit_btn.dart';

/// main game view
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          // word guess section
          Expanded(
            child: GameArea(
              guessData: [
                CharModel(char: 's', ctState: CharTileState.unactive),
                CharModel(char: 't', ctState: CharTileState.unactive),
                CharModel(char: 'o', ctState: CharTileState.unactive),
                CharModel(char: 'c', ctState: CharTileState.unactive),
                CharModel(char: 'k', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
                CharModel(char: '', ctState: CharTileState.unactive),
              ],
            ),
          ),
          // keyboard
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KeyRow(rowData: k1),
              KeyRow(rowData: k2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 45),
                  UIHelper.horizontalSpaceVerySmall(),
                  KeyRow(rowData: k3),
                  UIHelper.horizontalSpaceVerySmall(),
                  const SubmitBtn(),
                ],
              ),
            ],
          ),
          UIHelper.verticalSpaceSmall(),
        ],
      ),
    );
  }
}
