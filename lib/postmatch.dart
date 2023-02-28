import 'package:flutter/material.dart';
import 'widgets.dart';
import 'code.dart';

class PostMatch extends StatefulWidget {
  //teleop page
  const PostMatch({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

  @override
  State<PostMatch> createState() => PostMatchState();
}

class PostMatchState extends State<PostMatch> {
  //all the objects added to the main page here

  String auto = '';
  String teleop = '';
  String endgame = '';
  bool win = false;
  int RP = 0;

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: ListView(children: [
      SizedBox(
          height: 1200,
          child: Column(children: [
            TextInput(
                title: 'auto comments',
                initial: widget.inputs['auto'],
                callback: (value) => send('auto', value)),
            const SizedBox(height: 20),
            TextInput(
                title: 'teleop comments',
                initial: widget.inputs['teleop'],
                callback: (value) => send('teleop', value)),
            const SizedBox(height: 20),
            TextInput(
                title: 'endgame comments',
                initial: widget.inputs['endgame'],
                callback: (value) => send('endgame', value)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Won:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: widget.inputs['win'],
                    onChanged: (bool? value) {
                      send('win', value ?? false);
                    },
                  ),
                ),
              ],
            ),
            Increment(
                title: 'RP',
                value: widget.inputs['RP'],
                callback: (value) => send('RP', value)),
          ]))
    ])));
  }
}
