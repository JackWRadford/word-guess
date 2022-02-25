import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/viewModels/statistics_model.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/shared/my_custom_alert_dialog.dart';
import 'package:word_guess/ui/widgets/statistics/barchart_section.dart';
import 'package:word_guess/ui/widgets/statistics/stat_section.dart';

/// alert dialog for statistics
/// used from the stats btn in app bar and when a game is concluded
class StatsDialog extends StatelessWidget {
  const StatsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatisticsModel _statsModal = Provider.of<StatisticsModel>(context);
    return MyCustomAlertDialog(
      title: 'Statistics',
      mainContent: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatSection(label: 'Games', value: _statsModal.getGames()),
              StatSection(label: 'Wins', value: _statsModal.getGamesWon()),
              StatSection(label: 'Win rate', value: _statsModal.getPercWin()),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          const BarchartSection(),
        ],
      ),
    );
  }
}
