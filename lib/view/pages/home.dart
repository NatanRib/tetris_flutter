import 'package:flutter/material.dart';
import 'package:tetris/view/pages/game.dart';

import '../../utils/my_colors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              child: Center(
                  child: Text(
                'Tettler',
                style: TextStyle(fontSize: 42, color: MyColors.red),
              )),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyColors.red,
                  width: 8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 42.0),
              child: SizedBox(
                width: 280,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: MyColors.yellowLight,
                    backgroundColor: MyColors.blue,
                    alignment: Alignment.center,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Game())),
                  child: Text(
                    'Start game',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
