import 'package:word_guess/core/enums/char_tile_state.dart';

/// model for charTile data
/// includes char string and char tile state
class CharModel {
  String? char;
  CharTileState ctState = CharTileState.unactive;

  CharModel({required this.char, this.ctState = CharTileState.active});
}
