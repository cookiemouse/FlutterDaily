import 'package:flutter/material.dart';
import 'pages/MyDrawer.dart';
import 'pages/HomePage.dart';

void main() => runApp(new MyApp());

final items = [
  '首页',
  '日常心理学',
  '用户推荐日报',
  '电影日报',
  '不许无聊',
  '设计日报',
  '大公司日报',
  '财经日报',
  '互联网安全',
  '开始游戏',
  '音乐日报',
  '动漫日报',
  '体育日报',
];

int _mDrawerIndex = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '知乎日报',
      home: new _AppPage(),
    );
  }
}

class _AppPage extends StatefulWidget {

  @override
  State createState() {
    return new _AppPageState();
  }
}

class _AppPageState extends State<_AppPage>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(
        items: items,
        onDrawerClick: (index){
          setState(() {
            _mDrawerIndex = index;
          });
        },
      ),
      appBar: new AppBar(
        title: getTitle(_mDrawerIndex),
        centerTitle: true,
      ),
      body: new HomePage(),
    );
  }

  Text getTitle(int index){
    return new Text(items[index]);
  }
}
