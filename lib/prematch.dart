import 'package:flutter/material.dart';
import 'widgets.dart';
import 'auto.dart';

class PreMatch extends StatefulWidget {
  //teleop page
  const PreMatch({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

  @override
  State<PreMatch> createState() => PreMatchState();
}

class PreMatchState extends State<PreMatch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: ListView(children: [
      SizedBox(
          height: 1200,
          child: Column(children: [
            TextInput(
                title: 'team number',
                initial: widget.inputs['team'],
                callback: (value) => send('team', value)),
            TextInput(
                title: 'match number',
                initial: widget.inputs['match'],
                callback: (value) => send('match', value)),
            TextInput(
                title: 'scouter',
                initial: widget.inputs['scouter'],
                callback: (value) => send('scouter', value)),
          ]))
    ])));
  }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }
}
