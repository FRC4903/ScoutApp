import 'package:flutter/material.dart';
import 'widgets.dart';
import 'auto.dart';
import 'teleop.dart'; //for testing

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
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
      // Column is a vertical, linear layout.
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
          const Expanded(
            child: Center(
              child: Teleop(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget { //top bar
  const MyAppBar({required this.title, super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          Expanded(
            child: title,
          ),
        ],
      ),
    );
  }
}