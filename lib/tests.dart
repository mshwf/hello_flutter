//Not for cohesive work!
import 'package:flutter/material.dart';

class TestsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TestCore(),
    );
  }
}

class TestCore extends StatefulWidget {
  const TestCore({
    Key key,
  }) : super(key: key);

  @override
  _TestCoreState createState() => _TestCoreState();
}

class _TestCoreState extends State<TestCore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Container(
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Center(
                        child: Text(
                      'Not for cohesive work!',
                      textDirection: TextDirection.ltr,
                    ))),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(height: 30,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Container(width: 30,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.green, Colors.red, Colors.blue],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class _TestsPageState extends State<TestsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               decoration: BoxDecoration(color: Colors.red),
//               child: Center(
//                   child: Text(
//                 'Not for cohesive work!',
//                 textDirection: TextDirection.ltr,
//               ))),
//         )
//       ],
//     );
//   }
// }
