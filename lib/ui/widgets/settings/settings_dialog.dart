import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/enums/settings_pos.dart';
import 'package:word_guess/core/theme_notifier.dart';
import 'package:word_guess/ui/widgets/shared/my_custom_alert_dialog.dart';
import 'package:word_guess/ui/widgets/shared/section_toggle.dart';

/// contains all app settings
class SettingsDialog extends StatelessWidget {
  const SettingsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCustomAlertDialog(
      hasClose: true,
      title: 'Settings',
      mainContent: Column(
        children: [
          SectionToggle(
            title: 'Dark mode',
            onChanged: (value) {
              Provider.of<ThemeNotifier>(context, listen: false)
                  .setTheme(value);
            },
            pos: SettingsPos.solo,
            value: Provider.of<ThemeNotifier>(context).getIsDarkMode(),
          ),
        ],
      ),
    );
  }
}
