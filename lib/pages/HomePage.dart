import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_daily/data/jsonbean/HomeBean.dart';
import 'package:flutter_daily/data/jsonbean/ThemeBean.dart';
import 'package:http/http.dart' as http;
import '../data/BaseData.dart';

int _mIndex;

class HomePage extends StatelessWidget {

  final int index;

  HomePage(this.index) {
    _mIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RefreshIndicator(
          child: new FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (0 == _mIndex) {
                  List<StoryBean> storyItems = snapshot.data.stories;
                  if (null != storyItems[0]) {
                    storyItems.insert(0, null);
                  }
                  List<TopStoriesBean> topItems = snapshot.data.top_stories;
                  return new ListView.builder(
                      itemCount: topItems.length,
                      itemBuilder: (context, index) {
                        if (0 == index) {
                          return new Container(
                            height: 220.0,
                            child: new PageView.builder(
                                pageSnapping: true,
                                itemCount: topItems.length,
                                itemBuilder: (context, indexTop) {
                                  return new GestureDetector(
                                    child: new Container(
                                      child: new Image.network(
                                        topItems[indexTop].image,
                                        fit: BoxFit.cover,
                                        height: 220.0,
                                      ),
                                    ),
                                    onTap: () {
                                      //TODO 点击事件
                                    },
                                  );
                                }
                            ),
                          );
                        }
                        return new ListTile(
                          title: new Container(
                            padding: const EdgeInsets.all(5.0),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new Text(
                                    storyItems[index].title,
                                    style: new TextStyle(fontSize: 14.0),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                new Image.network(
                                  storyItems[index].images[0],
                                  width: 100.0,
                                  height: 80.0,
                                  alignment: Alignment.centerRight,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            //todo 点击
                          },
                        );
                      });
                } else {
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
                            snapshot.data.background,
                            fit: BoxFit.cover,
                            height: 220.0,
                          );
                        }
                        String image = storiesItems[index].images[0];
                        if (null != image) {
                          return new ListTile(
                            title: new Container(
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
                            },
                          );
                        } else {
                          return new ListTile(
                            title: new Container(
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
                            },
                          );
                        }
                      });
                }
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
}

Future<Object> fetchData() async {
  final response = await http.get(getUrl(_mIndex));
  final responseJson = json.decode(response.body);
  print('responseJson--> $responseJson');
  print('\n');
  print('=============================');
  print('\n');
  if (0 == _mIndex) {
    return new HomeBean.fromJson(responseJson);
  }
  return new ThemeBean.fromJson(responseJson);
}

Future<Null> _pullToRefresh() async {
  return fetchData();
}
