import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_controls.dart';

class FlareApp extends StatefulWidget {
  createState() => _FlareAppState();
}

class _FlareAppState extends State<FlareApp> {
  bool isOpen = false;
  final FlareControls controls = FlareControls();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            controls.play("Untitled");
          });
        },
        child: FlareActor(
          'assets/heart.flr',
          animation: 'Untitled',
          controller: controls,
        ),
      ),
    );
  }
}
