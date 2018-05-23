import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_daily/data/jsonbean/HomeBean.dart';
import 'package:http/http.dart' as http;
import '../data/BaseData.dart';
import 'DetailPage.dart';
import 'DetailPage2.dart';
import 'DetailPage3.dart';
import 'DetailPage4.dart';

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
                          //  跳转到新页面
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new DetailPage4(storyItems[index].id),
                            ),
                          );
                        },
                      );
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
}

Future<Object> fetchData() async {
  final response = await http.get(getUrl(_mIndex));
  final responseJson = json.decode(response.body);
  print('responseJson--> $responseJson');
  print('\n');
  print('=============================');
  print('\n');
  return new HomeBean.fromJson(responseJson);
}

Future<Null> _pullToRefresh() async {
  return fetchData();
}
