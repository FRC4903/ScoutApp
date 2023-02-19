import 'package:flutter/material.dart';
import 'widgets.dart';
import 'prematch.dart';

void main() {
  runApp(
    const MaterialApp(
      title: '4903 Scouting App', // used by the OS task switcher
      home: MyScaffold(), //main container class
    ),
  );
}

class MyScaffold extends StatelessWidget { //container class
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column( children: [
          SizedBox(height: 30),
          Expanded(
            child: Center(
              child: PreMatch(),
            ),
          ),
      ])
    ));
  }
}
