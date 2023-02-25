import 'package:flutter/material.dart';
import 'widgets.dart';

class Teleop extends StatefulWidget {
  //teleop page
  const Teleop({super.key, required this.past});

  final String past;

  @override
  State<Teleop> createState() => TeleopState();
}

class TeleopState extends State<Teleop> {
  //all the objects added to the main page here
  int cupper = 0;
  int cmid = 0;
  int clower = 0;
  int qupper = 0;
  int qmid = 0;
  int qlower = 0;
  int links = 0;
  int pickup = 0;
  int defense = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView(children: [
          Center(
            child: Row(children: [
              Column(children: [
                Icon(
                    color: Colors.orange,
                    Icons.change_history_rounded,
                    size: 50),
                Increment(
                    title: 'upper',
                    callback: (value) => setState(() => cupper =
                        value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
                Increment(
                    title: 'middle',
                    callback: (value) => setState(() => cmid = value)),
                Increment(
                    title: 'lower',
                    callback: (value) => setState(() => clower = value)),
              ]),
              Column(children: [
                Icon(color: Colors.purple, Icons.square_rounded, size: 50),
                Increment(
                    title: 'upper',
                    callback: (value) => setState(() => qupper =
                        value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
                Increment(
                    title: 'middle',
                    callback: (value) => setState(() => qmid = value)),
                Increment(
                    title: 'lower',
                    callback: (value) => setState(() => qlower = value)),
              ]),
              Column(children: [
                Icon(color: Colors.black, Icons.clear_all_rounded, size: 50),
                Increment(
                    title: 'links',
                    callback: (value) => setState(() => links =
                        value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
                Increment(
                    title: 'picked up',
                    callback: (value) => setState(() => pickup = value)),
                Increment(
                    title: 'defense',
                    callback: (value) => setState(() => defense = value)),
              ]),
            ]),
          )
        ]),
      ),
    );
  }
}
