import 'package:flutter/material.dart';
import 'package:hello_flutter/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class ListVeiewApp extends StatefulWidget {
  @override
  _ListVeiewAppState createState() => _ListVeiewAppState();
}

class _ListVeiewAppState extends State<ListVeiewApp> {
  List<Article> _articles = articles;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          body: RefreshIndicator(
              onRefresh: () async {
                await new Future.delayed(const Duration(seconds: 1));
                setState(() {
                  _articles.removeAt(0);
                });
              },
              child: ListViewPage())),
    );
  }
}

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: articles.map(_buildItem).toList());
  }

  Widget _buildItem(Article e) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(e.text, style: TextStyle(fontSize: 24.0)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '${e.commentsCount} comments',
              ),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  final fakeUrl = 'http://${e.domain}';
                  if (await canLaunch(fakeUrl)) {
                    launch(fakeUrl);
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
