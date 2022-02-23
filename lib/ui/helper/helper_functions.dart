import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/core/themeNotifier.dart';
import 'package:word_guess/ui/shared/app_colours.dart';

/// return color for charTile depending on state
Color getColorForState(BuildContext ctx, CharTileState ctState) {
  ThemeNotifier tn = Provider.of<ThemeNotifier>(ctx);
  Color bg = tn.getCardColor();
  switch (ctState) {
    case CharTileState.active:
      return bg;
    case CharTileState.unactive:
      return bg.withOpacity(0.4);
    case CharTileState.selected:
      return bg;
    case CharTileState.incorrect:
      return myGrey;
    case CharTileState.exists:
      return myYellow;
    case CharTileState.correct:
      return myGreen;
    default:
      return bg;
  }
}
