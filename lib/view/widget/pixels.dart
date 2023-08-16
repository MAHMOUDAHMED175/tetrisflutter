


import 'package:flutter/material.dart';


class Pixels extends StatelessWidget {

  var color;

  Pixels({super.key,
    required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4)
        ),
        margin: EdgeInsets.all(5),
        child: Icon(Icons.insert_emoticon_sharp),
      ),
    );
  }
}
