import 'package:flutter/material.dart';
import 'package:word_guess/core/locator.dart';
import 'package:word_guess/core/services/shared_pref_service.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_themes.dart';

///Notify app of selected theme
class ThemeNotifier with ChangeNotifier {
  final SharedPrefService _prefService = locator<SharedPrefService>();

  //returns bool if dark mode or not
  bool getIsDarkMode() {
    return _prefService.getDarkMode();
  }

  ///sets new theme (updates DB)
  setTheme(bool value) async {
    _prefService.setDarkMode(value);
    notifyListeners();
  }

  ///returns themeData for current theme
  ThemeData getTheme() {
    return getIsDarkMode() ? darkTheme : lightTheme;
  }

  ///get background colour for current theme
  Color getBGColor() {
    return getIsDarkMode() ? darkBG : lightBG;
  }

  ///get card colour for current theme
  Color getCardColor() {
    return getIsDarkMode() ? darkCard : lightCard;
  }

  ///get highlight colour for current theme
  Color getHighlightColor(bool reverse) {
    bool value = getIsDarkMode();
    if (reverse) {
      value = !value;
    }
    return (value) ? Colors.white : Colors.black;
  }
}
