import 'package:word_guess/core/locator.dart';
import 'package:word_guess/core/services/shared_pref_service.dart';
import 'package:word_guess/core/viewModels/base_model.dart';

/// view model for analytics dialog
class StatisticsModel extends BaseModel {
  final SharedPrefService _prefService = locator<SharedPrefService>();

  /// get total games played
  String getGames() {
    return _prefService.getGames().toString();
  }

  /// get games won
  String getGamesWon() {
    return _prefService.getGamesWon().toString();
  }

  /// get percentage win rate
  String getPercWin() {
    int games = _prefService.getGames();
    if (games == 0) {
      return '-';
    } else {
      return ((_prefService.getGamesWon() / games) * 100).toInt().toString() +
          '%';
    }
  }

  /// get barchart attempts data
  List<int> getAttempsData() {
    return _prefService.getAttemptsData();
  }
}
