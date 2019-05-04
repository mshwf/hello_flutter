//The Boring Flutter Development Show [Pilot Episode]:
//https://www.youtube.com/watch?v=yr8F2S3Amas&list=LL-eE33O-B5bGUXWQyHzjvOA&index=3&t=0s
import 'package:flutter/material.dart';
import 'package:hello_flutter/articles.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewApp extends StatefulWidget {
  @override
  _ListViewAppState createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  List<Article> _articles = articles;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View',
      theme: ThemeData(
        primarySwatch: Colors.purple,
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
    return Padding(key: Key(e.text),
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
