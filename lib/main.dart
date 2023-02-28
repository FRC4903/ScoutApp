import 'package:flutter/material.dart';
import 'widgets.dart';
import 'prematch.dart';
import 'auto.dart';
import 'teleop.dart';
import 'endgame.dart';
import 'postmatch.dart';
import 'code.dart';

void main() {
  runApp(
    const MaterialApp(
      title: '4903 Scouting App', // used by the OS task switcher
      home: MyScaffold(),
    ),
  );
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => ScaffoldState();
}

class ScaffoldState extends State<MyScaffold> {
  var inputs = {
    'team': '',
    'match': '',
    'scouter': '',
    'extraCones': 0,
    'extraCubes': 0,
    'startPos': 0,
    'moved': false,
    'balanceAttempt': false,
    'preCone': false,
    'preCube': false,
    'preScore': false,
    'autoDocked': false,
    'autoEngaged': false,
    'cupper': 0,
    'cmid': 0,
    'clower': 0,
    'qupper': 0,
    'qmid': 0,
    'qlower': 0,
    'links': 0,
    'pickup': 0,
    'loadStation': false,
    'floor': false,
    'bumpable': false,
    'didDefending': false,
    'wereDefended': false,
    'time': 0,
    'attempts': 0,
    'endDocked': false,
    'endEngaged': false,
    'parked': false,
    'auto': '',
    'teleop': '',
    'endgame': '',
    'win': false,
    'RP': 0
  };

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Column(children: [
              SizedBox(height: 30),
              Expanded(
                child: Center(
                  child: PageView(children: [
                    PreMatch(
                        inputs: inputs,
                        callback: (value) => setState(() => inputs = value)),
                    Auto(
                        inputs: inputs,
                        callback: (value) => setState(() => inputs = value)),
                    Teleop(
                        inputs: inputs,
                        callback: (value) => setState(() => inputs = value)),
                    Endgame(
                        inputs: inputs,
                        initialtime: inputs['time'],
                        callback: (value) => setState(() => inputs = value)),
                    PostMatch(
                        inputs: inputs,
                        callback: (value) => setState(() => inputs = value)),
                    QRCode(inputs: inputs)
                  ]),
                ),
              )
            ])));
  }
}
