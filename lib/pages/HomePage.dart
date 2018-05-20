import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_daily/data/jsonbean/HomeBean.dart';
import 'package:http/http.dart' as http;
import '../data/Urls.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RefreshIndicator(
          child: new FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<StoryBean> items = snapshot.data.stories;
                return new ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return new ListTile(
                        title: new Container(
                          padding: const EdgeInsets.all(5.0),
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Text(
                                  items[index].title,
                                  style: new TextStyle(fontSize: 14.0),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              new Image.network(
                                items[index].images[0],
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

Future<HomeBean> fetchData() async {
  final response = await http.get(Urls.LATEST);
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
