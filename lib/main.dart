import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tetris/game.dart';
import 'package:tetris/utils/my_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(background: blueGrey),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: yellow,
            backgroundColor: blue,
            alignment: Alignment.center,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
      home: const Game(),
    ),
  );
}
