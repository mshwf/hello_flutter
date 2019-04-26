import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.lime,
        ),
        home: new MyHomePage(title: 'MSHWF'),
        routes: <String, WidgetBuilder>{
          '/SecondPage': (BuildContext context) =>
              new SecondPage(title: 'page B')
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SecondPage createState() => new _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  void setData() {
    Navigator.of(context).pop("dd");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("second widget")),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new CircularLabel("data1"),
            new CircularLabel("data2"),
            new CircularLabel("data3"),
            new CircularLabel("data4"),
            new ImageWidget("assets/nature/a.jpg"),
            new ImageWidget("assets/nature/b.jpg"),
            new ImageWidget("assets/nature/c.png"),
            new ImageWidget("assets/nature/d.jpg"),
            new ImageWidget("assets/nature/e.jpg"),
            new ImageWidget("assets/nature/f.jpg"),
            new ImageWidget("assets/nature/g.jpeg"),
            new ImageWidget("assets/nature/h.jpg"),
            new ImageWidget("assets/nature/i.jpg"),
            TextField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'أدخل النص'),
            ),
            new FlatButton(
              child: new Text("Return"),
              onPressed: setData,
            )
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  ImageWidget( this.asset);

  final String asset;
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage(asset);
    var image = new Image(image: assetsImage, width: 400.0, height: 220.0);
    return new Container(
      child: image,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {

  void openSecondPage(BuildContext context) async {
    await Navigator.of(context).pushNamed('/SecondPage');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
                child: new Text("open second page"),
                textColor: Colors.brown,
                onPressed: () async => openSecondPage(
                    context) // Navigator.of(context).pushNamed('/SecondPage');
                )
          ],
        ),
      ),
    );
  }
}

class CircularLabel extends StatelessWidget {
  final String text;

  CircularLabel(this.text);
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Text(text,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.green),
          borderRadius: new BorderRadius.circular(4.0)),
    );
  }
}