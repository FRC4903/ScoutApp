import 'package:flutter/material.dart';
import 'widgets.dart';
import 'endgame.dart';

//hello

class Teleop extends StatefulWidget {
  //teleop page
  const Teleop({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

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
  bool loadStation = false;
  bool floor = false;
  bool bumpable = false;
  bool didDefending = false;
  bool wereDefended = false;

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(children: [
      Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                  color: Colors.orange, Icons.change_history_rounded, size: 50),
              Increment(
                  title: 'upper',
                  value: widget.inputs['cupper'],
                  callback: (value) => send('cupper',
                      value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
              Increment(
                  title: 'middle',
                  value: widget.inputs['cmid'],
                  callback: (value) => send('cmid', value)),
              Increment(
                  title: 'lower',
                  value: widget.inputs['clower'],
                  callback: (value) => send('clower', value)),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(color: Colors.purple, Icons.square_rounded, size: 50),
              Increment(
                  title: 'upper',
                  value: widget.inputs['qupper'],
                  callback: (value) => send('qupper',
                      value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
              Increment(
                  title: 'middle',
                  value: widget.inputs['qmid'],
                  callback: (value) => send('qmid', value)),
              Increment(
                  title: 'lower',
                  value: widget.inputs['qlower'],
                  callback: (value) => send('qlower', value)),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(color: Colors.black, Icons.clear_all_rounded, size: 50),
              Increment(
                  title: 'links',
                  value: widget.inputs['links'],
                  callback: (value) => send('links',
                      value)), //increment widget (add, subtract, and show value), setstate sets the variable to the output from the widget
              Increment(
                  title: 'picked up',
                  value: widget.inputs['pickup'],
                  callback: (value) => send('pickup', value)),
            ]),
          ]),
          SizedBox(
            height: 5,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Obtains peice from:',
                          style: TextStyle(fontSize: 21),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Load Station:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: widget.inputs['loadStation'],
                                onChanged: (bool? value) {
                                  send('loadStation', value ?? false);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Floor:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: widget.inputs['floor'],
                                onChanged: (bool? value) {
                                  send('floor', value ?? false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Defence:',
                          style: TextStyle(fontSize: 21),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Were Defended:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: widget.inputs['wereDefended'],
                                onChanged: (bool? value) {
                                  send('wereDefended', value ?? false);
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Did Defending:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: widget.inputs['didDefending'],
                                onChanged: (bool? value) {
                                  send('didDefending', value ?? false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ability to go over bump:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: widget.inputs['bumpable'],
                        onChanged: (bool? value) {
                          send(
                              'bumpable',
                              value ??
                                  false); //////////////////////////////////////////////////////
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ]),
      )
    ]));
  }
}
