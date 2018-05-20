import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RefreshIndicator(
          child: new ListView(
            children: <Widget>[
              new ListTile(title: new Text('1'),),
              new ListTile(title: new Text('2'),),
              new ListTile(title: new Text('3'),),
              new ListTile(title: new Text('4'),),
              new ListTile(title: new Text('5'),),
              new ListTile(title: new Text('6'),),
              new ListTile(title: new Text('7'),),
              new ListTile(title: new Text('8'),),
              new ListTile(title: new Text('9'),),
              new ListTile(title: new Text('10'),),
              new ListTile(title: new Text('11'),),
            ],
          ),
          onRefresh: _pullToRefresh,
      ),
    );
  }
}

Future<Null> _pullToRefresh() async {
  return null;
}