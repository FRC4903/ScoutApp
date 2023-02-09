import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: MyScaffold(),

    ),
  );
}

class MyScaffold extends StatelessWidget {
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
              child: Page(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
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
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}


class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Center(
            child: Column(
              children: [
              Text('Hello World'),
              Increment(title: 'upper'),
              Increment(title: 'middle'),
              Increment(title: 'lower')
            ]
          ),
          )
        ]
      )
    );
  }
}

class Increment extends StatefulWidget {
  const Increment({super.key, required this.title});

  final String title;

  @override
  State<Increment> createState () => IncrementState();

}

class IncrementState extends State<Increment> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                padding: EdgeInsets.all(10),
                child: Text("${widget.title}"),
              ),
            Column(
              children: [
                IconButton(onPressed: increment, icon: Icon(Icons.add_circle_outline)),
                Text('$value'),
                IconButton(onPressed: decrement, icon: Icon(Icons.south_outlined)),
              ])
              ]
            )
        ]
      )
    );
  }

  void increment() {
    setState(() {
      value++;
    });
  }
  void decrement() {
    setState(() {
      value--;
    });
  }

}