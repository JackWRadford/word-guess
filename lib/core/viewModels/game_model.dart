import 'dart:math';

import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/core/viewModels/base_model.dart';

/// view model for main game view
class GameModel extends BaseModel {
  final List<String> _words = ["cigar", "rebut", "shout", "doubt", "clout"];

  List<CharModel> charData = [
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
    CharModel(char: '', ctState: CharTileState.unactive),
    CharModel(char: '', ctState: CharTileState.unactive),
    CharModel(char: '', ctState: CharTileState.unactive),
    CharModel(char: '', ctState: CharTileState.unactive),
    CharModel(char: '', ctState: CharTileState.unactive),
  ];

  /// word to be guessed
  String currentWord = '';

  /// index of charTile currently being guessed
  int _currentIndex = 0;
  int _attempt = 1;

  final int _maxAttempts = 6;

  final int wordLength = 5;

  final _random = Random();

  GameModel() {
    setRandWord();
  }

  void setRandWord() {
    String _newWord = _words[_random.nextInt(_words.length)];
    currentWord = _newWord;
    charData[0].ctState = CharTileState.selected;
    notifyListeners();
  }

  int _getIndexForList() {
    return _currentIndex + ((_attempt - 1) * wordLength);
  }

  void keyboardInput(String char) {
    bool _notLastChar = (_currentIndex < wordLength - 1);
    if (_currentIndex <= wordLength - 1) {
      charData[_getIndexForList()] = CharModel(
          char: char,
          ctState:
              (_notLastChar) ? CharTileState.active : CharTileState.selected);
      if (_notLastChar) {
        _currentIndex++;
        charData[_getIndexForList()] =
            CharModel(char: '', ctState: CharTileState.selected);
      }
    }
    notifyListeners();
  }

  void backspace() {
    if (_currentIndex > 0) {
      if ((_currentIndex < wordLength - 1) ||
          (charData[_getIndexForList()].char.isEmpty)) {
        charData[_getIndexForList()].ctState = CharTileState.active;
        _currentIndex--;
      }
      charData[_getIndexForList()] =
          CharModel(char: '', ctState: CharTileState.selected);
    }
    notifyListeners();
  }

  /// called by submit btn
  /// return [isLastAttempt,isCorrect]
  List<bool> submit() {
    List<bool> result = [false, false];
    if ((_currentIndex == wordLength - 1) &&
        (charData[_getIndexForList()].char.isNotEmpty)) {
      charData[_getIndexForList()].ctState = CharTileState.active;
      _currentIndex = 0;
      if (_attempt < _maxAttempts) {
        _attempt++;
        charData[_getIndexForList()].ctState = CharTileState.selected;
      } else {
        // all attempts used
        result[0] = true;
      }
      notifyListeners();
    }
    return result;
  }
}
