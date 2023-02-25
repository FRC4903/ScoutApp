import 'package:flutter/material.dart';
import 'main.dart';
import 'widgets.dart';

import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  //increment objects
  const QRCode({super.key, required this.data});

  final String data;

  @override
  State<QRCode> createState() => QRState();
}

class QRState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Row(children: [
      Container(
          padding: EdgeInsets.all(20),
          child: QrImage(
            data: '${widget.data}',
            version: QrVersions.auto,
            size: 450,
          )),
      IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        MyScaffold())); //when the button is pressed, a qr code page is created with the following data input
          },
          icon: Icon(Icons.east_outlined)),
    ]));
  }
}
