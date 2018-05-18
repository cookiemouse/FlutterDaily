import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  final String title;


  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: null,
    );
  }
}