/// state of a tile showing a char
/// [unactive] if in a later row
/// [active] if inside the row currently being used or useable key on keyboard
/// [selected] if this tile is currently being guessed
/// [incorrect] if char did not exist in the word
/// [correct] if char exists in the position in the word
/// [exists] if char exists in the word but not in that position
enum CharTileState { unactive, active, selected, incorrect, correct, exists }
