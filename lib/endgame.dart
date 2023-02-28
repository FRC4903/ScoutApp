import 'dart:async';

import 'package:flutter/material.dart';
import 'widgets.dart';
import 'postmatch.dart';
import 'dart:ffi';
//import 'widgets2.dart';

class Endgame extends StatefulWidget {
  const Endgame(
      {super.key,
      required this.inputs,
      required this.callback,
      required this.initialtime});

  final inputs;
  final callback;
  final initialtime;

  @override
  State<Endgame> createState() => _EndgameState();
}

class _EndgameState extends State<Endgame> {
  int attempts = 0;
  int seconds = 0, minutes = 0;
  String digitsSec = '00', digitsMin = '00';
  Timer? timer;
  bool started = false;
  bool endDocked = false;
  bool endEngaged = false;
  bool parked = false;

  int initialmins = 0;
  int initialsecs = 0;

  @override
  void initState() {
    initialsecs = widget.initialtime % 60;
    initialmins = ((widget.initialtime - initialsecs) / 60).round();
    digitsSec = (initialsecs >= 10) ? "$initialsecs" : "0$initialsecs";
    digitsMin = (initialmins >= 10) ? "$initialmins" : "0$initialmins";
  }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;

      if (localSeconds > 59) {
        localMinutes++;
        localSeconds = 0;
      }

      setState(() {
        seconds = localSeconds;
        int tseconds = seconds + initialsecs;
        minutes = localMinutes;
        int tminutes = minutes + initialmins;
        digitsSec = (tseconds >= 10) ? "$tseconds" : "0$tseconds";
        digitsMin = (tminutes >= 10) ? "$tminutes" : "0$tminutes";
        send('time', seconds + minutes * 60);
      });
    });
  }

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "ENDGAME",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 125,
                                width: 300,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    style: BorderStyle.solid,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "$digitsMin:$digitsSec",
                                    style: TextStyle(fontSize: 90),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RawMaterialButton(
                                    onPressed: () {
                                      (!started) ? start() : stop();
                                    },
                                    child: Icon(
                                      (!started)
                                          ? Icons.play_circle_outline_rounded
                                          : Icons.stop_circle_outlined,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 80.0,
                                    ),
                                  ),
                                ],
                              ),
                              /*SizedBox(
                                  width: 80,
                                ),*/
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Increment(
                                    title: 'Attempts',
                                    value: widget.inputs['attempts'],
                                    callback: (value) =>
                                        send('attempts', value),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Docked',
                                        style: TextStyle(
                                          fontSize: 25,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Transform.scale(
                                        scale: 2,
                                        child: Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      const Color.fromARGB(
                                                          255, 0, 0, 0)),
                                          value: widget.inputs['endDocked'],
                                          onChanged: (bool? value) {
                                            send('endDocked', value!);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Engaged',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      value: widget.inputs['endEngaged'],
                                      onChanged: (bool? value) {
                                        send('endEngaged', value!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Parked',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Transform.scale(
                                    scale: 2,
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => const Color.fromARGB(
                                              255, 0, 0, 0)),
                                      value: widget.inputs['parked'],
                                      onChanged: (bool? value) {
                                        send('parked', value!);
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
