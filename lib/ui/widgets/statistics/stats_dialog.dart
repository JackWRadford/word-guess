import 'package:flutter/material.dart';
import 'package:word_guess/ui/widgets/shared/my_custom_alert_dialog.dart';

/// alert dialog for statistics
/// used from the stats btn in app bar and when a game is concluded
class StatsDialog extends StatelessWidget {
  const StatsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomAlertDialog(
      title: 'Statistics',
      mainContent: Column(
        children: const [
          Center(
            child: Text('implement stats'),
          )
        ],
      ),
    );
  }
}
