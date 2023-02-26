import 'package:flutter/material.dart';
import 'widgets.dart';
import 'endgame.dart';

class Teleop extends StatefulWidget { //teleop page
  const Teleop({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

  @override
  State<Teleop> createState () => TeleopState();
}

class TeleopState extends State<Teleop> { //all the objects added to the main page here

  int cupper = 0;
  int cmid = 0;
  int clower = 0;
  int qupper = 0;
  int qmid = 0;
  int qlower = 0;
  int links = 0;
  int pickup = 0;
  int defense = 0;

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Expanded(
                child:  ListView( 
                  children: [
                    Center(
                      child: Row(
                        children: [
                          Column(
                            children: [
                            Icon(color: Colors.orange, Icons.change_history_rounded, size:50),
                            Increment(title: 'upper', value: widget.inputs['cupper'], callback: (value) => send('cupper', value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
                            Increment(title: 'middle', value: widget.inputs['cmid'], callback: (value) => send('cmid', value)),
                            Increment(title: 'lower', value: widget.inputs['clower'], callback: (value) => send('clower', value)),
                          ]),
                          Column(
                            children: [
                            Icon(color: Colors.purple, Icons.square_rounded, size:50),
                            Increment(title: 'upper', value: widget.inputs['qupper'], callback: (value) => send('qupper', value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
                            Increment(title: 'middle', value: widget.inputs['qmid'], callback: (value) => send('qmid', value)),
                            Increment(title: 'lower', value: widget.inputs['qlower'], callback: (value) => send('qlower', value)),
                          ]),
                          Column(
                            children: [
                            Icon(color: Colors.black, Icons.clear_all_rounded, size:50),
                            Increment(title: 'links', value: widget.inputs['links'], callback: (value) => send('links', value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
                            Increment(title: 'picked up', value: widget.inputs['pickup'], callback: (value) => send('pickup', value)),
                            Increment(title: 'defense', value: widget.inputs['defense'], callback: (value) => send('defense', value)),
                          ])
                        ])
                    )
              ])
            )
    );
  }
}