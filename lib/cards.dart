import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
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
    color: Color(0xFF21A179),
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
            PageIndicator(3, page),
            // _pagesIndcator(3, page, tickerProvider),
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

class PageIndicator extends StatefulWidget {
  final int length;
  final double currentPage;
  const PageIndicator(this.length, this.currentPage);
  State<StatefulWidget> createState() => PageIndicatorState();
}

class PageIndicatorState extends State<PageIndicator>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Widget> points = List.generate(widget.length, (i) {

      var size = 10.0;

      if (i == widget.currentPage.ceil()) {
        setState(() {
          size += 2.0;
        });
      }

      return AnimatedSize(
        duration: Duration(milliseconds: 200),
        vsync: this,
        child: Padding(
          padding: const EdgeInsets.only(right: 2.0),
          child: SizedBox(
            width: size,
            height: size,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              width: size,
              height: size,
            ),
          ),
        ),
      );
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: points,
    );
  }
}
