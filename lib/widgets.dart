import 'package:flutter/material.dart';

class Increment extends StatefulWidget { //increment objects
  const Increment({super.key, required this.title});

  final String title;

  @override
  State<Increment> createState () => IncrementState();

}

class IncrementState extends State<Increment> { //state of the increment object (since it updates as user interacts)
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