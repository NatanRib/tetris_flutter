import 'package:flutter/material.dart';
import 'package:tetris/controller/home_controller.dart';
import 'package:tetris/controller/store/game_store.dart';
import 'package:tetris/view/pages/game.dart';
import 'package:tetris/view/widgets/navigation_page_button.dart';

import '../../utils/my_colors.dart';

class Home extends StatefulWidget {
  Home({super.key});
  final GameStore store = GameStore();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController(widget.store);
    super.initState();
  }

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
            if (widget.store.isPaused)
              Padding(
                padding: const EdgeInsets.only(top: 42.0),
                child: NavigationPageButton(
                  text: 'Resume',
                  navigateFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Game(store: widget.store),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: NavigationPageButton(
                text: 'New game',
                navigateFunction: () {
                  controller.newGame();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Game(store: widget.store),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
