import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'widgets.dart';
import 'endgame.dart';

import 'code.dart';

class Teleop extends StatefulWidget { //teleop page
  const Teleop({super.key});

  @override
  State<Teleop> createState () => TeleopState();
}

class TeleopState extends State<Teleop> { //all the objects added to the main page here

  int upper = 0;
  int mid = 0;
  int lower = 0;
  String text1 = '';
  String text2 = '';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Center(
            child: Column(
              children: [
              Increment(title: 'upper', callback: (value) => setState(() => upper = value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
              Increment(title: 'middle', callback: (value) => setState(() => mid = value)),
              Increment(title: 'lower', callback: (value) => setState(() => lower = value)),
            ]
          ),
          ),
          TextInput(title: 'auto comments', callback: (value) => setState(() => text1 = value)), //text input widget (text box), setstate sets variable to the text from the user after deselecting the box
          TextInput(title: 'teleop comments', callback: (value) => setState(() => text2 = value)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => QRCode(data: '$upper,$mid,$lower,$text1,$text2'))); //when the button is pressed, a qr code page is created with the following data input
            }, icon: Icon(Icons.east_outlined)),
          ]
      )
    );
  }
}