import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/game/game_area.dart';
import 'package:word_guess/ui/widgets/keyboard/my_keyboard.dart';
import 'package:word_guess/ui/widgets/settings/settings_dialog.dart';
import 'package:word_guess/ui/widgets/statistics/stats_dialog.dart';
import 'package:word_guess/ui/widgets/tutorial/tutorial_dialog.dart';

/// main game view
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    // show tutorial dialog if first open
    if (!Provider.of<GameModel>(context, listen: false).getNotFirst()) {
      // ensure widget is completely built before attempting to show a dialog
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showDialog(context: context, builder: (ctx) => const TutorialDialog());
        // update shredPrefs notFirst value
        Provider.of<GameModel>(context, listen: false).setNotFirst();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog(context: context, builder: (ctx) => const StatsDialog());
          },
          icon: const Icon(CupertinoIcons.chart_bar_alt_fill),
        ),
        // title: Text(Provider.of<GameModel>(context).currentWord),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (ctx) => const TutorialDialog());
            },
            icon: const Icon(CupertinoIcons.info),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (ctx) => const SettingsDialog());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            // word guess section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: largePadding),
                child: GameArea(
                  guessData: Provider.of<GameModel>(context).charData,
                ),
              ),
            ),
            // keyboard
            const MyKeyboard(),
            UIHelper.verticalSpaceSmall(),
          ],
        ),
      ),
    );
  }
}
