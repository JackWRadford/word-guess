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

  final int _wordLength = 5;

  final _random = Random();

  GameModel() {
    setRandWord();
  }

  void setRandWord() {
    String _newWord = _words[_random.nextInt(_words.length)];
    currentWord = _newWord;
    notifyListeners();
  }

  void keyboardInput(String char) {
    if (_currentIndex < _wordLength) {
      charData[_currentIndex + ((_attempt - 1) * _wordLength)] =
          CharModel(char: char, ctState: CharTileState.active);
      _currentIndex++;
    }
    notifyListeners();
  }

  void backspace() {
    if (_currentIndex > 0) {
      _currentIndex--;
      charData[_currentIndex + ((_attempt - 1) * _wordLength)] =
          CharModel(char: '', ctState: CharTileState.active);
    }
    notifyListeners();
  }

  void submit() {
    if (_currentIndex == _wordLength) {
      _currentIndex = 0;
      _attempt++;
      if (_attempt == _maxAttempts) {
        print('done');
      }
      notifyListeners();
    }
  }
}
