import 'dart:math';

import 'package:word_guess/core/all_words_list.dart';
import 'package:word_guess/core/enums/char_tile_state.dart';
import 'package:word_guess/core/enums/submit_state.dart';
import 'package:word_guess/core/locator.dart';
import 'package:word_guess/core/models/char_model.dart';
import 'package:word_guess/core/services/shared_pref_service.dart';
import 'package:word_guess/core/viewModels/base_model.dart';
import 'package:word_guess/core/words_list.dart';

/// view model for main game view
class GameModel extends BaseModel {
  final SharedPrefService _prefService = locator<SharedPrefService>();

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

  bool correctGuess = false;

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
    charData = [];
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
  SubmitState submit() {
    SubmitState submitState = SubmitState.wrong;
    if ((_currentIndex == wordLength - 1) &&
        (charData[_getIndexForList()].char.isNotEmpty)) {
      if (!_checkWordExists()) {
        return SubmitState.notWord;
      }
      if (_checkWordAttempt()) {
        // correct word was guessed
        correctGuess = true;
        submitState = SubmitState.correct;
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
        submitState = SubmitState.last;
        _resetKeyboard();
      }
      _currentIndex = 0;
      // update shared prefs if end of game
      if ((submitState == SubmitState.correct) ||
          (submitState == SubmitState.last)) {
        _updateSharedPrefs(submitState);
      }
      notifyListeners();
    }
    return submitState;
  }

  void _updateSharedPrefs(SubmitState s) {
    if (s == SubmitState.correct) {
      _prefService.setGamesWon();
      _prefService.setAttempt(_attempt);
    }
    _prefService.setGames();
  }

  bool _checkWordExists() {
    int checkStart = ((_attempt - 1) * wordLength);
    int checkEnd = checkStart + wordLength;
    String word = "";
    for (var i = checkStart; i < checkEnd; i++) {
      word += charData[i].char;
    }
    return (allWords.contains(word) || words.contains(word));
  }

  /// return true if the word has been guessed correctly
  /// also updates char tile states to show colours
  bool _checkWordAttempt() {
    int checkStart = ((_attempt - 1) * wordLength);
    int checkEnd = checkStart + wordLength;
    bool result = true;
    // list of chars that have state already set
    String charList = '';
    // check for letters in the correct place
    int count = 0;
    for (var i = checkStart; i < checkEnd; i++) {
      String char = charData[i].char;
      if (char == currentWord[count]) {
        charData[i].ctState = CharTileState.correct;
        _updateKeyTile(char, CharTileState.correct, false);
        charList += char;
      }
      count++;
    }
    // check for chars that exist (not already correct/
    //repeated and already accounted for correct amount)
    count = 0;
    for (var i = checkStart; i < checkEnd; i++) {
      String char = charData[i].char;
      if ((currentWord.contains(char)) &&
          (char.allMatches(currentWord).length >
              char.allMatches(charList).length) &&
          (charData[i].ctState != CharTileState.correct)) {
        charData[i].ctState = CharTileState.exists;
        _updateKeyTile(char, CharTileState.exists, true);
        charList += char;
        result = false;
      }
      count++;
    }
    // set other chars to wrong
    count = 0;
    for (var i = checkStart; i < checkEnd; i++) {
      String char = charData[i].char;
      CharTileState ctState = charData[i].ctState;
      if ((ctState != CharTileState.correct) &&
          (ctState != CharTileState.exists)) {
        charData[i].ctState = CharTileState.incorrect;
        _updateKeyTile(char, CharTileState.incorrect, true);
        result = false;
      }
      count++;
    }
    return result;
  }

  /// set state for given keyboard tile
  /// [check] only set new state if current is active
  void _updateKeyTile(String char, CharTileState ctState, bool check) {
    bool _checkKeyRow(List<CharModel> list) {
      for (var k in list) {
        if (k.char == char) {
          if (check) {
            if (k.ctState == CharTileState.active) k.ctState = ctState;
          } else {
            k.ctState = ctState;
          }
          return true;
        }
      }
      return false;
    }

    bool stop = false;
    stop = _checkKeyRow(k1);
    if (stop) return;
    stop = _checkKeyRow(k2);
    if (stop) return;
    stop = _checkKeyRow(k3);
  }

  void resetGame() {
    correctGuess = false;
    _currentIndex = 0;
    _attempt = 1;
    _generateCharData();
    _setRandWord();
    notifyListeners();
  }
}
