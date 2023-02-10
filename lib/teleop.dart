import 'package:flutter/material.dart';
import 'widgets.dart';
import 'endgame.dart';

import 'code.dart';

class Teleop extends StatefulWidget { //main page
  const Teleop({super.key});

  @override
  State<Teleop> createState () => TeleopState();
}

class TeleopState extends State<Teleop> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Center(
            child: Column(
              children: [
              Increment(title: 'upper'),
              Increment(title: 'middle'),
              Increment(title: 'lower'),
            ]
          ),
          ),
        ]
      )
    );
  }
}