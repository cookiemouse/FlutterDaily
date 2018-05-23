import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_daily/data/jsonbean/ThemeBean.dart';
import 'package:flutter_daily/data/BaseData.dart';
import 'DetailPage.dart';
import 'DetailPage2.dart';
import 'DetailPage3.dart';
import 'DetailPage4.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ThemePage extends StatelessWidget {

  final int _mIndex;

  ThemePage(this._mIndex) {
    print('_mIndex--> $_mIndex');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RefreshIndicator(
          child: new FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              print('snapshot--> ${snapshot.toString()}');
              if (snapshot.hasData) {
                String description = snapshot.data.description;
                print('description--> $description');

                List<StoriesBean> storiesItems = snapshot.data.stories;
                if (null != storiesItems[0]) {
                  storiesItems.insert(0, null);
                }
                return new ListView.builder(
                    itemCount: storiesItems.length,
                    itemBuilder: (context, index) {
                      if (0 == index) {
                        return new Image.network(
                          snapshot.data.image,
                          fit: BoxFit.cover,
                          height: 220.0,
                        );
                      }
                      List<String> images = storiesItems[index].images;
                      print('images--> $images');
                      if (null != images) {
                        return new ListTile(
                          title: new Container(
                            height: 80.0,
                            padding: const EdgeInsets.all(5.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    storiesItems[index].title,
                                    style: new TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                new Image.network(
                                  storiesItems[index].images[0],
                                  width: 100.0,
                                  height: 80.0,
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            //todo 点击
                            //  跳转到新页面
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new DetailPage4(storiesItems[index].id),
                              ),
                            );
                          },
                        );
                      } else {
                        return new ListTile(
                          title: new Container(
                            height: 80.0,
                            padding: const EdgeInsets.all(5.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    storiesItems[index].title,
                                    style: new TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            //todo 点击
                            //  跳转到新页面
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => new DetailPage4(storiesItems[index].id),
                              ),
                            );
                          },
                        );
                      }
                    });
              } else if (snapshot.hasError) {
                return new Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
          onRefresh: _pullToRefresh,
        ),
      ),
    );
  }

  Future<Object> fetchData() async {
//    print('url--> ${getUrl(_mIndex)}');
//    NetUtil.get(getUrl(_mIndex), (responseJson) {
//      print('fetchData.responseJson--> $responseJson');
//      return new ThemeBean.fromJson(responseJson);
//    });
    final response = await http.get(getUrl(_mIndex));
    final responseJson = json.decode(response.body);
    print('responseJson--> $responseJson');
    print('\n');
    print('=============================');
    print('\n');
    return new ThemeBean.fromJson(responseJson);
  }

  Future<Null> _pullToRefresh() async {
    return fetchData();
  }

}

