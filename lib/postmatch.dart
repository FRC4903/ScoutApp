import 'package:flutter/material.dart';
import 'widgets.dart';
import 'code.dart';

class PostMatch extends StatefulWidget {
  //teleop page
  const PostMatch({super.key, required this.past});

  final String past;

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

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Center(
        child: ListView(children: [
          SizedBox(
            height: 1200,
            child: Column(children: [
              TextInput(
                  title: 'auto comments',
                  callback: (value) => setState(() => auto = value)),
              TextInput(
                  title: 'teleop comments',
                  callback: (value) => setState(() => teleop = value)),
              TextInput(
                  title: 'endgame comments',
                  callback: (value) => setState(() => endgame = value)),
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
                      value: win,
                      onChanged: (bool? value) {
                        setState(() {
                          win = value ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Increment(
                  title: 'RP', callback: (value) => setState(() => RP = value)),
            ]),
          )
        ]),
      )
    ]);
  }
}
