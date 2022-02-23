import 'package:flutter/material.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';
import 'package:word_guess/ui/widgets/game/char_tile.dart';

/// list of TileRows for guesses
class GameArea extends StatelessWidget {
  final List<CharModel> guessData;
  const GameArea({Key? key, required this.guessData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: largePadding),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 1),
        itemCount: guessData.length,
        itemBuilder: (BuildContext ctx, i) =>
            CharTile(char: guessData[i].char, ctState: guessData[i].ctState),
      ),
    );
  }
}
