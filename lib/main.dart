import 'package:flutter/material.dart';
import 'pages/MyDrawer.dart';
import 'pages/HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '知乎日报',
      home: new _AppPage(),
    );
  }
}

class _AppPage extends StatelessWidget{

  final items = ['日常心理学', '用户推荐日报', '电影日报', '不许无聊'];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(items: items,),
      body: new HomePage(title: '知乎日报'
          '',),
    );
  }
}
