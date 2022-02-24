import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/ui/shared/app_ui_sizes.dart';
import 'package:word_guess/ui/shared/app_ui_spacing.dart';
import 'package:word_guess/ui/widgets/game/game_area.dart';
import 'package:word_guess/ui/widgets/keyboard/my_keyboard.dart';
import 'package:word_guess/ui/widgets/statistics/stats_dialog.dart';

/// main game view
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

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
            onPressed: () {},
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
