import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const List<List<int>> _pixels = [
  [1, 1, 1, 1, 0, 0, 1, 1, 0],
  [1, 0, 0, 0, 0, 1, 0, 0, 1],
  [1, 1, 1, 0, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 1, 0, 0, 1],
  [1, 1, 1, 0, 0, 0, 1, 1, 0],
];

class FlutterComm50000 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _on = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int y = 0; y < 7; y++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int x = 0; x < 9; x++)
                  CupertinoSwitch(
                    value: _on && _pixels[y][x] > 0,
                    onChanged: (_) => _toggle(),
                  )
              ],
            )
        ],
      )),
    );
  }

  void _toggle() {
    setState(() => _on = !_on);
  }
}
