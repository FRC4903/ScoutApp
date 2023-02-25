import 'package:flutter/material.dart';
import 'widgets.dart';

class PreMatch extends StatefulWidget {
  //teleop page
  const PreMatch({super.key});

  @override
  State<PreMatch> createState() => PreMatchState();
}

class PreMatchState extends State<PreMatch> {
  String team = '';
  String match = '';
  String scouter = '';

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                child: const Text(
                  'Pre-Match',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextInput(
                  title: "Team Number",
                  callback: (value) => setState(() => team = value)),
              const SizedBox(height: 30),
              TextInput(
                  title: "Match Number",
                  callback: (value) => setState(() => match = value)),
              const SizedBox(height: 30),
              TextInput(
                  title: "Scouter",
                  callback: (value) => setState(() => scouter = value)),
              const SizedBox(height: 30),
            ],
          ),
        )
      ],
    );
  }
}
