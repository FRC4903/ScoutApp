import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'prematch.dart';
import 'widgets.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget { //increment objects
  const QRCode({super.key, required this.inputs});

  final inputs;

  @override
  State<QRCode> createState () => QRState();

}

class QRState extends State<QRCode> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(children: [Container(
      padding: EdgeInsets.all(20),
      child: QrImage(
      data: '${widget.inputs['team']}~~~${widget.inputs['match']}~~~${widget.inputs['scouter']}~~~${widget.inputs['extraCones']}~~~${widget.inputs['extraCubes']}~~~${widget.inputs['startPos']}~~~${widget.inputs['moved']}~~~${widget.inputs['balanceAttempt']}~~~${widget.inputs['preCone']}~~~${widget.inputs['preCube']}~~~${widget.inputs['preScore']}~~~${widget.inputs['autoDocked']}~~~${widget.inputs['autoEngaged']}~~~${widget.inputs['cupper']}~~~${widget.inputs['cmid']}~~~${widget.inputs['clower']}~~~${widget.inputs['qupper']}~~~${widget.inputs['qmid']}~~~${widget.inputs['qlower']}~~~${widget.inputs['links']}~~~${widget.inputs['pickup']}~~~${widget.inputs['defense']}~~~${widget.inputs['time']}~~~${widget.inputs['attempts']}~~~${widget.inputs['endDocked']}~~~${widget.inputs['endEngaged']}~~~${widget.inputs['auto']}~~~${widget.inputs['teleop']}~~~${widget.inputs['endgame']}~~~${widget.inputs['win']}~~~${widget.inputs['RP']}',
      version: QrVersions.auto,
      size: 450,
      )
      ), IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => MyScaffold())); //when the button is pressed, a qr code page is created with the following data input
        }, icon: Icon(Icons.east_outlined)),
        ])
    );
  }
}