import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_controls.dart';

class App_Flare extends StatefulWidget {
  createState() => _App_FlareState();
}

class _App_FlareState extends State<App_Flare> {
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
