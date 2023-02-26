import 'package:flutter/material.dart';
import 'widgets.dart';
import 'teleop.dart';

class Auto extends StatefulWidget {
  const Auto({super.key, required this.inputs, required this.callback});

  final inputs;
  final callback;

  @override
  State<Auto> createState() => Funkyauto();
}

class Funkyauto extends State<Auto> {
  /*int extraCones = 0;
  int extraCubes = 0;
  bool moved = false;
  bool balanceAttempt = false;
  bool preCone = false;
  bool preCube = false;
  bool preScore = false;
  bool autoDocked = false;
  bool autoEngaged = false;
*/
  //ignore these, use startpos()
  List<bool> isRectangleTapped = List.filled(3, false);
  List<bool> isRectangleTapped2 = List.filled(3, false);

  //use this to get start pos corresponding to picture
  int startPos() {
    int pos = -1;
    if (isRectangleTapped2[2] == true)
      pos = 4;
    else
      for (int i = 1; i < 4; i++) {
        if (isRectangleTapped[pos]) pos = i;
      }
    print(pos);
    return pos;
  }

  void onRectangleTapped1(int index, List<bool> list) {
    isRectangleTapped2[2] = false;
    isRectangleTapped[0] = false;
    isRectangleTapped[1] = false;
    isRectangleTapped[2] = false;
    setState(() {
      list[index] = true;
      widget.inputs['startPos'] = index+1;
    });
  }

  void onRectangleTapped2(int index, List<bool> list) {
    if (index == 2) {
      isRectangleTapped2[2] = false;
      isRectangleTapped[0] = false;
      isRectangleTapped[1] = false;
      isRectangleTapped[2] = false;
      setState(() {
        list[index] = !list[index];
        widget.inputs['startPos'] = 'none';
      });
    }
  }

  void send(String tag, value) {
    setState(() => widget.inputs[tag] = value);
    widget.callback(widget.inputs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 75,
                      alignment: Alignment.center,
                      child: Text(
                        'Tap on the start location of the robot:',
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 350,
                          height: 250,
                          child: Image.asset('images/arena2.png'),
                          alignment: Alignment.centerLeft,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 350,
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  3,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () => onRectangleTapped1(
                                          index, isRectangleTapped),
                                      child: Container(
                                        width: 100,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: isRectangleTapped[index]
                                              ? Colors.red
                                              : Colors.transparent,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: 350,
                              alignment: Alignment.centerRight,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(3, (index) {
                                    return GestureDetector(
                                      onTap: () => onRectangleTapped2(
                                          index, isRectangleTapped2),
                                      child: Container(
                                        width: 100,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          color: isRectangleTapped2[index]
                                              ? Colors.red
                                              : Colors.transparent,
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ],
                    ),
                    /*Increment(
                  title: 'upper',
                  callback: (value) => setState(() => upper = value)),*/
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Robot exited community:',
                          style: TextStyle(fontSize: 20),
                        ),
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: widget.inputs['moved'],
                            onChanged: (bool? value) {
                              send('moved' ,value ?? false);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Balancing:',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Attempted:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: widget.inputs['balanceAttempt'],
                                    onChanged: (bool? value) {
                                      send('balanceAttempt', value ?? false);
                                    },
                                  ),
                                ),
                              ],
                            ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Docked:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: widget.inputs['autoDocked'],
                                    onChanged: (bool? value) {
                                      send('autoDocked', value ?? false);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Engaged:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: widget.inputs['autoEngaged'],
                                    onChanged: (bool? value) {
                                      send('autoEngaged', value ?? false);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Preload:',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cone:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: widget.inputs['preCone'],
                                    onChanged: (bool? value) {
                                      send('preCone', value ?? false);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cube:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: widget.inputs['preCube'],
                                    onChanged: (bool? value) {
                                      send('preCube', value ?? false);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Scored:',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Transform.scale(
                                  scale: 1.5,
                                  child: Checkbox(
                                    value: widget.inputs['preScore'],
                                    onChanged: (bool? value) {
                                      send('preScore', value ?? false);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Increment(
                            title: 'Extra Cones', value: widget.inputs['extraCones'],
                            callback: (value) =>
                                send('extraCones', value)),
                        SizedBox(
                          width: 30,
                        ),
                        Increment(
                            title: 'Extra Cubes', value: widget.inputs['extraCubes'],
                            callback: (value) =>
                                send('extraCubes', value)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
