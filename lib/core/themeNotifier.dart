import 'package:flutter/material.dart';
import 'package:word_guess/core/enums/app_theme.dart';
import 'package:word_guess/ui/shared/app_colours.dart';
import 'package:word_guess/ui/shared/app_themes.dart';

///Notify app of selected theme
class ThemeNotifier with ChangeNotifier {
  ThemeNotifier() {
    //load settings (needed earlier for theme)
    getSettings();
  }

  ///gets settings from the DB and stores in dataService
  Future<void> getSettings() async {
    // await this._dataService.getSettingsDB();
    notifyListeners();
  }

  //returns MyAppTheme enum value
  MyAppTheme _getMyAppTheme() {
    // TODO get theme from shared prefs
    return MyAppTheme.darkTheme;
  }

  ///sets new theme (updates DB)
  setTheme(MyAppTheme newAppTheme) async {
    // TODO update theme in shared prefs
    notifyListeners();
  }

  ///returns themeData for current theme
  ThemeData getTheme() {
    MyAppTheme value = _getMyAppTheme();
    switch (value) {
      case MyAppTheme.lightTheme:
        return lightTheme;
      case MyAppTheme.darkTheme:
        return darkTheme;

      default:
        return lightTheme;
    }
  }

  ///get background colour for current theme
  Color getBGColor() {
    MyAppTheme value = _getMyAppTheme();
    switch (value) {
      case MyAppTheme.lightTheme:
        return lightBG;
      case MyAppTheme.darkTheme:
        return darkBG;
      default:
        return lightBG;
    }
  }

  ///get card colour for current theme
  Color getCardColor() {
    MyAppTheme value = _getMyAppTheme();
    switch (value) {
      case MyAppTheme.lightTheme:
        return lightCard;
      case MyAppTheme.darkTheme:
        return darkCard;
      default:
        return lightCard;
    }
  }

  ///get highlight colour for current theme
  Color getHighlightColor(bool reverse) {
    MyAppTheme value = _getMyAppTheme();
    switch (value) {
      case MyAppTheme.lightTheme:
        if (reverse) {
          return Colors.white;
        }
        return Colors.black;
      case MyAppTheme.darkTheme:
        if (reverse) {
          return Colors.black;
        }
        return Colors.white;
      default:
        return lightCard;
    }
  }
}
