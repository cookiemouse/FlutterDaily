import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final List<String> items;

  MyDrawer({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: new Text('${items[index]}'),
                onTap: (){
                  //TODO item点击事件
                },
              );
            }));
  }
}
