import 'package:flutter/material.dart';
import 'package:hello_flutter/provider/userModel.dart';
import 'package:provider/provider.dart';

// class MySlider extends StatefulWidget {
//   @override
//   _MySliderState createState() => _MySliderState();
// }

// class _MySliderState extends State<MySlider> {
//   double _value = 1.0;

//   @override
//   Widget build(BuildContext context) {
//     final number = Provider.of<MyNumber>(context);
//     return Slider(
//       value: _value,
//       onChanged: (newValue) {
//         textState.setState(() {
//           textState.num = newValue;
//         });
//         setState(() {
//           _value = newValue;
//         });
//       },
//     );
//   }
// }

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _value = 1.0;
int x= null;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Slider(
      value: user.userCode,
      onChanged: (value) => user.userCode = value,
    );
  }
}

class MyText extends StatefulWidget {
  @override
  _MyTextState createState() {
    textState = _MyTextState();
    return textState;
  }
}

_MyTextState textState;

class _MyTextState extends State<MyText> {
  void increase() {
    num++;
  }

  double num = 1;
  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
        builder: (context, myNum, _) => Text('${myNum.username}'));
  }
}
