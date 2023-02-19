import 'package:flutter/material.dart';
import 'widgets.dart';
import 'auto.dart';

class PreMatch extends StatefulWidget { //teleop page
  const PreMatch({super.key});

  @override
  State<PreMatch> createState () => PreMatchState();
}

class PreMatchState extends State<PreMatch> { //all the objects added to the main page here

  String team = '';
  String match = '';
  String scouter = '';

  @override
  Widget build(BuildContext context) {
    return PageView(
        children: [
        Expanded( child: Center( child: ListView(
          children: [SizedBox(height: 1200, child: Column( children: [
            TextInput(title: 'team number', callback: (value) => setState(() => team = value)),
            TextInput(title: 'match number', callback: (value) => setState(() => match = value)),
            TextInput(title: 'scouter', callback: (value) => setState(() => scouter = value)),
        ]))]))),
        Auto(past: '$team,$match,$scouter')
    ]);
  }
}