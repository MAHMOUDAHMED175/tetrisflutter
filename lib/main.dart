import 'package:flutter/material.dart';
import 'package:tetrisflutter/view/screen/game.dart';
import 'package:tetrisflutter/view/screen/home_page.dart';

void main() {
  runApp( TetrisGame());
}

class TetrisGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TETRIS Flutter Game',
      debugShowCheckedModeBanner: false,
      home: HomePageGame(),
    );
  }
}



