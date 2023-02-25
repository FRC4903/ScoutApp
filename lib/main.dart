import 'package:flutter/material.dart';
import 'prematch.dart';
import 'auto.dart';
import 'teleop.dart';
import 'endgame.dart';
import 'postmatch.dart';
import 'code.dart';
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

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: PageView(
          children: [
            PreMatch(),
            Auto(
                past:
                    '${Widget},$PreMatchState.team,$PreMatchState.match,$PreMatchState.scouter'),
            Teleop(
                past:
                    '$Funkyauto.extraCones,$Funkyauto.extraCubes,$Funkyauto.moved,$Funkyauto.balanceAttempt,$Funkyauto.preCone,$Funkyauto.preCube,$Funkyauto.preScore,$Funkyauto.autoDocked,$Funkyauto.autoEngaged'),
            Endgame(
                past:
                    '$TeleopState.cupper,$TeleopState.cmid,$TeleopState.clower,$TeleopState.qupper,$TeleopState.qmid,$TeleopState.qlower,$TeleopState.links,$TeleopState.pickup,$TeleopState.defense'),
            PostMatch(
                past:
                    '$EndgameState.{seconds + minutes * 60},$EndgameState.attempts,$EndgameState.endDocked,$EndgameState.endEngaged'),
            QRCode(
                data:
                    '${Widget},$PostMatchState.auto,$PostMatchState.teleop,$PostMatchState.endgame,$PostMatchState.win,$PostMatchState.RP')
          ],
        ),
      ),
    );
  }
}
