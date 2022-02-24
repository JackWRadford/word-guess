import 'package:shared_preferences/shared_preferences.dart';

/// service to interaface with sharedPreferences
/// NSUserDefaults on iOS and SharedPreferences on Android

/// singleton shared preferences instance (async on first (this) call)
SharedPreferences? prefs;

const String _games = 'games';
const String _gamesWon = 'gamesWon';
const String _darkMode = 'darkMode';
const String _noAds = 'noAds';

const List<String> _attempts = [
  'attemptsOne',
  'attemptsTwo',
  'attemptsThree',
  'attemptsFour',
  'attemptsFive',
  'attemptsSix',
];

///initialize shared preferences (called asynchronously in main())
Future<void> initSharedPrefs() async {
  prefs = await SharedPreferences.getInstance();
}

class SharedPrefService {
  /// get number of games
  int getGames() {
    return _myGetInt(_games);
  }

  /// get number of games won
  int getGamesWon() {
    return _myGetInt(_gamesWon);
  }

  /// get darkMode value
  bool getDarkMode() {
    return _myGetBool(_darkMode);
  }

  /// get noAds value
  bool getNoAds() {
    return _myGetBool(_noAds);
  }

  /// get barchart data for attempts
  List<int> getAttemptsData() {
    List<int> results = [0, 0, 0, 0, 0, 0];
    for (var i = 0; i < 6; i++) {
      results[i] = _myGetInt(_attempts[i]);
    }
    return results;
  }

  /// iterate number of games played
  Future<void> setGames() async {
    await _mySetInt(_games, getGames() + 1);
  }

  /// iterate number of games won
  Future<void> setGamesWon() async {
    await _mySetInt(_gamesWon, getGamesWon() + 1);
  }

  /// set darkMode value
  Future<void> setDarkMode(bool value) async {
    await _mySetBool(_darkMode, value);
  }

  /// set noAds value
  Future<void> setNoAds(bool value) async {
    await _mySetBool(_noAds, value);
  }

  /// set attempt number for given attempt
  /// [a] is the attempt int to be iterated
  Future<void> setAttempt(int a) async {
    // get new value
    List<int> currentValues = getAttemptsData();
    await _mySetInt(_attempts[a - 1], currentValues[a - 1]++);
  }

  /// used by [getGames], [getGamesWon], [getAttemptsData]
  /// get int value for [key] and set default value to 0
  int _myGetInt(String key) {
    int? result = (prefs != null) ? prefs!.getInt(key) : null;
    return (result != null) ? result : 0;
  }

  /// used by [getDarkMode]
  /// get bool value for [key] and set default value to false
  bool _myGetBool(String key) {
    bool? result = (prefs != null) ? prefs!.getBool(key) : null;
    return (result != null) ? result : false;
  }

  /// used by [setGames], [setGamesWon], [setAttempt]
  /// set int [value] for [key]
  Future<void> _mySetInt(String key, int value) async {
    if (prefs != null) await prefs!.setInt(key, value);
  }

  /// used by [setDarkMode]
  /// set iboolnt [value] for [key]
  Future<void> _mySetBool(String key, bool value) async {
    if (prefs != null) await prefs!.setBool(key, value);
  }
}
