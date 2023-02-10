import 'package:flutter/material.dart';
import 'widgets.dart';
import 'endgame.dart';

import 'code.dart';

class Teleop extends StatelessWidget { //main page
  const Teleop({super.key});

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
            QRCode(data: 'peepeepoopoo')
        ]
      )
    );
  }
}