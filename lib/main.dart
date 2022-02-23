import 'package:flutter/material.dart';
import 'package:word_guess/ui/shared/app_themes.dart';
import 'package:word_guess/ui/views/game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const MainView(),
    );
  }
}
