import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:word_guess/core/locator.dart';
import 'package:word_guess/core/themeNotifier.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/core/services/shared_pref_service.dart';
import 'package:word_guess/ui/views/game_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize SharedPrefs
  await initSharedPrefs();

  //initialize GetIt Locator
  initLocator();

  runApp(
    //wrap app in theme notifier as theme is needed earlier
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //set preferred device orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GameModel>(
          create: (_) => GameModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeNotifier>(context).getTheme(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            ),
          );
        },
        home: const MainView(),
      ),
    );
  }
}

///scroll behavior to remove overscroll splash from Android scroll views
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
