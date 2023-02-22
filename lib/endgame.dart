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
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( home: PageView( children: [Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 12, 101),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                              color: const Color.fromARGB(144, 255, 255, 255),
                              border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0),
                                style: BorderStyle.solid,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                '00:00',
                                style: TextStyle(fontSize: 90),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.pause_circle_outline_rounded,
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 80,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Increment(
                            title: 'Attempts',
                            callback: (value) =>
                                setState(() => attempts = value),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'success',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Transform.scale(
                                scale: 2,
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) =>
                                          const Color.fromARGB(255, 0, 0, 0)),
                                  value: success,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      success = value!;
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
<<<<<<< Updated upstream
    ),
    PostMatch(past: '${widget.past},$attempts,$success')
=======
      PostMatch(past: '${widget.past},${seconds + 60* minutes},$attempts,$success')
>>>>>>> Stashed changes
    ]));
  }
}
