import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tetris/utils/my_colors.dart';
import 'package:tetris/view/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.blueGrey,
        textTheme: const TextTheme(
          labelLarge: TextStyle(fontSize: 28, color: MyColors.yellow),
        ),
        colorScheme:
            const ColorScheme.dark(background: Color.fromARGB(255, 7, 13, 19)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: MyColors.yellow,
            backgroundColor: MyColors.blue,
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
      home: Home(),
      // home: const Game(),
    ),
  );
}
