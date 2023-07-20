import 'package:flutter/material.dart';
import 'package:tetris/controller/home_controller.dart';
import 'package:tetris/model/store/game_store.dart';
import 'package:tetris/view/pages/game.dart';
import 'package:tetris/view/widgets/navigation_page_button.dart';

import '../../utils/my_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.red,
                  width: 8,
                ),
              ),
              child: const Center(
                child: Text(
                  'Tettler',
                  style: TextStyle(fontSize: 42, color: MyColors.red),
                ),
              ),
            ),
            if (GameStore.isPaused)
              Padding(
                padding: const EdgeInsets.only(top: 42.0),
                child: NavigationPageButton(
                  text: 'Resume',
                  navigateTo: const Game(),
                  secundaryFunction: () => controller.resumeGame(),
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(top: 42.0),
              //TODO: New game feature not working yet
              child: SizedBox(
                  width: 280,
                  child: NavigationPageButton(
                    text: 'New game',
                    navigateTo: Game(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
