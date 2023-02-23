import 'dart:async';

import 'package:flutter/material.dart';
import 'widgets.dart';
import 'postmatch.dart';
import 'dart:ffi';
//import 'widgets2.dart';

class Endgame extends StatefulWidget {
  const Endgame({super.key, required this.past});

  final String past;

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
        minutes = localMinutes;
        digitsSec = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitsMin = (minutes >= 10) ? "$minutes" : "0$minutes";
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
    return MaterialApp(
        home: PageView(children: [
      Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 12, 101),
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
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(79, 255, 255, 255),
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
                                    color: const Color.fromARGB(
                                        144, 255, 255, 255),
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
                                        color: Colors.white,
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
                                const SizedBox(
                                  width: 40,
                                ),
                                Increment(
                                  title: 'Attempts',
                                  callback: (value) =>
                                      setState(() => attempts = value),
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
                                        value: endDocked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            endDocked = value!;
                                          });
                                        },
                                      ),
                                    )
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
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                                (states) =>
                                                    const Color.fromARGB(
                                                        255, 0, 0, 0)),
                                        value: endEngaged,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            endEngaged = value!;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 40,
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
      ),
      PostMatch(
          past:
              '${widget.past},${seconds + minutes * 60},$attempts,$endDocked,$endEngaged')
    ]));
  }
}
