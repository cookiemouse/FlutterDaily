import 'package:flutter/material.dart';
import 'pages/MyDrawer.dart';
import 'pages/HomePage.dart';
import 'pages/ThemePage.dart';
import 'data/BaseData.dart';

void main() => runApp(new MyApp());

final items = [
  mBaseData[0].title,
  mBaseData[1].title,
  mBaseData[2].title,
  mBaseData[3].title,
  mBaseData[4].title,
  mBaseData[5].title,
  mBaseData[6].title,
  mBaseData[7].title,
  mBaseData[8].title,
  mBaseData[9].title,
  mBaseData[10].title,
  mBaseData[11].title,
  mBaseData[12].title,
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

class _AppPageState extends State<_AppPage> {

  @override
  Widget build(BuildContext context) {
    print('_mDrawerIndex--> $_mDrawerIndex');
    print('page--> ${_mDrawerIndex == 0 ? new HomePage(_mDrawerIndex) : new ThemePage(_mDrawerIndex)}');
    return new Scaffold(
      drawer: new MyDrawer(
        items: items,
        onDrawerClick: (index) {
          setState(() {
            _mDrawerIndex = index;
          });
        },
      ),
      appBar: new AppBar(
        title: getTitle(_mDrawerIndex),
        centerTitle: true,
      ),
      body: _mDrawerIndex == 0 ? new HomePage(_mDrawerIndex) : new ThemePage(_mDrawerIndex),
    );
  }

  Text getTitle(int index) {
    return new Text(mBaseData[index].title);
  }
}
