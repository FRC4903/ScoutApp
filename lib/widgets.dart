/*import 'package:flutter/material.dart';

typedef void IntCallback(int value);      //callback for an integer value taken as a parameter by increment widget
typedef void StringCallback(String value); //callback for a string value taken as a parameter by textinput widget

class Increment extends StatefulWidget { //increment values
  const Increment({super.key, required this.title, required this.callback});

  final String title;
  final IntCallback callback;

  @override
  State<Increment> createState () => IncrementState();

}

class IncrementState extends State<Increment> { //state of the increment object (since it updates as user interacts)
  int value = 0;  //stores the amount of whatever your increment is for

  @override
  Widget build(BuildContext context) {  
    return SizedBox(     //container for the widget
      width: 150,
      child: Row(
        children: [
          Container(
            width: 70,
            padding: EdgeInsets.all(10),
            child: Text("${widget.title}"),
          ),
        Column(
          children: [
            IconButton(onPressed: increment, icon: Icon(Icons.add_circle_outline)),
            Text('$value'),
            IconButton(onPressed: decrement, icon: Icon(Icons.south_outlined)),
          ])
          ]
        )
    );
  }

  void increment() {
    setState(() {
      value++;
    });
    widget.callback(value);
  }
  void decrement() {
    setState(() {
      value--;
    });
    widget.callback(value);
  }

}

class TextInput extends StatefulWidget { //increment objects
  const TextInput({super.key, required this.title, required this.callback});

  final String title;
  final StringCallback callback;

  @override
  State<TextInput> createState () => TextState();

}

class TextState extends State<TextInput> { //state of the increment object (since it updates as user interacts)
  String value = '';

  TextEditingController textController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      if (!focus.hasFocus) {
        setText();
      }
    });
  }

  @override
  void dispose()
  {
    focus.removeListener((){});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row (
        children: [
          SizedBox(
            width: 200,
            child:
            TextField(
              scrollPadding: EdgeInsets.all(20.0),
              focusNode: focus,
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '${widget.title}',
                hintText: 'Enter comments here...',
                ),
              ),
          ),
      ])
    );
  }

  void setText() {
    setState(() {
      value = textController.text;
    });
    widget.callback(value);
  }

} */

import 'package:flutter/material.dart';

typedef void IntCallback(
    int value); //callback for an integer value taken as a parameter by increment widget
typedef void StringCallback(
    String
        value); //callback for a string value taken as a parameter by textinput widget

class Increment extends StatefulWidget {
  //increment values
  const Increment({super.key, required this.title, required this.callback});

  final String title;
  final IntCallback callback;

  @override
  State<Increment> createState() => IncrementState();
}

class IncrementState extends State<Increment> {
  //state of the increment object (since it updates as user interacts)
  int value = 0; //stores the amount of whatever your increment is for

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(144, 255, 255, 255),
            borderRadius: BorderRadius.circular(9.0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            )),
        //container for the widget
        width: 250,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "${widget.title}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: decrement,
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: 40,
                      )),
                  Text(
                    '$value',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  IconButton(
                      onPressed: increment,
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 40,
                      )),
                ]),
          )
        ]));
  }

  void increment() {
    setState(() {
      value++;
    });
    widget.callback(value);
  }

  void decrement() {
    if (value > 0) {
      setState(() {
        value--;
      });
    }
    widget.callback(value);
  }
}

class TextInput extends StatefulWidget {
  //increment objects
  const TextInput({super.key, required this.title, required this.callback});

  final String title;
  final StringCallback callback;

  @override
  State<TextInput> createState() => TextState();
}

class TextState extends State<TextInput> {
  //state of the increment object (since it updates as user interacts)
  String value = '';

  TextEditingController textController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    super.initState();
    focus.addListener(() {
      if (!focus.hasFocus) {
        setText();
      }
    });
  }

  @override
  void dispose() {
    focus.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [
      Container(
        width: 500,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(144, 255, 255, 255),
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: TextField(
          focusNode: focus,
          controller: textController,
          style: TextStyle(height: 5),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '${widget.title}',
            hintText: 'Enter comments here...',
          ),
        ),
      ),
    ]));
  }

  void setText() {
    setState(() {
      value = textController.text;
    });
    widget.callback(value);
  }
}
