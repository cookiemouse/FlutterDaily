import 'package:flutter/material.dart';

int _selectIndex = 0;

class MyDrawer extends StatelessWidget {
  final List<String> items;
  final onDrawerClick;

  MyDrawer({Key key, this.items, this.onDrawerClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView.builder(
            itemCount: items.length,
            controller: new ScrollController(keepScrollOffset: false),
            itemBuilder: (context, index) {
              return new ListTile(
                selected: isSelected(index),
                title: new Text('${items[index]}'),
                onTap: (){
                  _selectIndex = index;
                  closeNavigation(context);
                  onDrawerClick(index);
                },
              );
            }));
  }

  //  关闭Drawer
  void closeNavigation(BuildContext context){
    Navigator.pop(context);
  }

  //  item背景
  bool isSelected(int index){
    return index == _selectIndex;
  }
}
