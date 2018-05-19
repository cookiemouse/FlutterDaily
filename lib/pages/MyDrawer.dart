import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final List<String> items;
  final onDrawerClick;

  MyDrawer({Key key, this.items, this.onDrawerClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return new ListTile(
                title: new Text('${items[index]}'),
                onTap: (){
                  _closeNavigation(context);
                  onDrawerClick(index);
                },
              );
            }));
  }
}


//  关闭Drawer
void _closeNavigation(BuildContext context){
  Navigator.pop(context);
}