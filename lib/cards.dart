import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: CardsPage()),
    );
  }
}

class CardsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  PageController controller = PageController();
  var currentPage = 1.0;
  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return _buildCards(controller, currentPage);
  }
}

Container _buildCards(PageController controller, double page) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      Colors.yellow,
      Colors.red,
    ])),
    child: Padding(
      padding:
          const EdgeInsets.only(top: 25.0, right: 5.0, left: 5.0, bottom: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ScrollCards(
                controller: controller,
              ),
            ),
            SizedBox(height: 5),
            _pagesIndcator(3, page),
          ],
        ),
      ),
    ),
  );
}

class ScrollCards extends StatelessWidget {
  const ScrollCards({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
              borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              '1.Hello :)',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFFF33cc),
                Color(0xFFffaa22),
              ]),
              color: Color(0xFFaaF7BC),
              borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              "2.Let's play!",
              style: TextStyle(color: Colors.white, fontSize: 35.0),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFFF4cfc),
                Color(0xFFf11c22),
              ]),
              color: Color(0xFFaaF7BC),
              borderRadius: BorderRadius.circular(5.0)),
          child: Center(
            child: Text(
              "3.Have fun!!",
              style: TextStyle(color: Colors.white, fontSize: 35.0),
            ),
          ),
        )
      ],
    );
  }
}

double current;
Row _pagesIndcator(int length, double currentPage) {
  current = currentPage;
  List<Widget> points = List.generate(length, (i) {
    print('i= $i');
    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        width: i == 0 ? 1 : i * currentPage.ceilToDouble() * 2.0,
        height: 5.0,
      ),
    );
  });
  print('currentPage= $currentPage');
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: points,
  );
}
