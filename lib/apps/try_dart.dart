import 'package:flutter/material.dart';
import 'dart:math';

class App_TestDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Test',
      theme: ThemeData(primaryColor: Color(0xFFFF394C)),
      home: Scaffold(body: TestDart()));
}

class TestDart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _App_TestDart();
}

class _App_TestDart extends State<TestDart>
    with SingleTickerProviderStateMixin {
  Color color = Colors.red;
  var offset = Offset.fromDirection(10);
  var blurRadius = 20.0;
  var radius = 0.0;
  bool isRed = true;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            color = isRed ? Colors.black : Colors.red;
            radius = isRed ? 50 : 0;
            isRed = !isRed;
          });
        },
        child: AnimatedContainer(
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
        BoxShadow(
          color: color,
          offset: offset,
          blurRadius: blurRadius,
        )
                ]),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 8,
          ),
      ),
    );
  }
}
