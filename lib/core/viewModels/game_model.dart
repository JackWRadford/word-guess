import 'dart:math';

import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/core/viewModels/base_model.dart';
import 'package:word_guess/core/words_list.dart';

/// view model for main game view
class GameModel extends BaseModel {
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

  List<CharModel> charData = [];

  /// word to be guessed
  String currentWord = '';

  /// index of charTile currently being guessed
  int _currentIndex = 0;
  int _attempt = 1;

  final int _maxAttempts = 6;

  final int wordLength = 5;

  final _random = Random();

  GameModel() {
    _generateCharData();
    _setRandWord();
  }

  void _setRandWord() {
    String _newWord = words[_random.nextInt(words.length)];
    currentWord = _newWord;
    charData[0].ctState = CharTileState.selected;
    notifyListeners();
  }

  void _generateCharData() {
    for (var i = 0; i < (wordLength * _maxAttempts); i++) {
      charData.add(CharModel(
          char: '',
          ctState: (i < wordLength)
              ? CharTileState.active
              : CharTileState.unactive));
    }
  }

  void _resetKeyboard() {
    for (var k in k1) {
      k.ctState = CharTileState.active;
    }
    for (var k in k2) {
      k.ctState = CharTileState.active;
    }
    for (var k in k3) {
      k.ctState = CharTileState.active;
    }
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
      bool isCorrect = _checkWordAttempt();
      if (isCorrect) {
        // correct word was guessed
        result[1] = true;
        _resetKeyboard();
      } else if (_attempt < _maxAttempts) {
        // set next row to active
        for (var i = _getIndexForList() + 1;
            i < _getIndexForList() + wordLength + 1;
            i++) {
          charData[i].ctState = CharTileState.active;
        }
        _attempt++;
        _currentIndex = 0;
        charData[_getIndexForList()].ctState = CharTileState.selected;
      } else {
        // all attempts used
        result[0] = true;
        _resetKeyboard();
      }
      _currentIndex = 0;
      notifyListeners();
    }
    return result;
  }

  /// return true if the word has been guessed correctly
  bool _checkWordAttempt() {
    int checkStart = ((_attempt - 1) * wordLength);
    int checkEnd = checkStart + wordLength;
    int count = 0;
    bool result = true;
    for (var i = checkStart; i < checkEnd; i++) {
      if (charData[i].char == currentWord[count]) {
        charData[i].ctState = CharTileState.correct;
        _updateKeyTile(charData[i].char, CharTileState.correct);
      } else if (currentWord.contains(charData[i].char)) {
        charData[i].ctState = CharTileState.exists;
        _updateKeyTile(charData[i].char, CharTileState.exists);
        result = false;
      } else {
        charData[i].ctState = CharTileState.incorrect;
        _updateKeyTile(charData[i].char, CharTileState.incorrect);
        result = false;
      }
      count++;
    }
    return result;
  }

  /// set state for given keyboard tile
  void _updateKeyTile(String char, CharTileState ctState) {
    for (var k in k1) {
      if (k.char == char) {
        k.ctState = ctState;
        return;
      }
    }
    for (var k in k2) {
      if (k.char == char) {
        k.ctState = ctState;
        return;
      }
    }
    for (var k in k3) {
      if (k.char == char) {
        k.ctState = ctState;
        return;
      }
    }
  }
}