import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '知乎日报',
      home: new HomePage(title: '首页',),
    );
  }
}
