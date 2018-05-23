import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../data/Urls.dart';
import '../data/jsonbean/DetailBean.dart';

String mStrContent = '';
int _mId = 0;

class DetailPage extends StatelessWidget {

  final int id;

  DetailPage(this.id) {
    _mId = id;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('内容'),
        centerTitle: true,
        actions: <Widget>[
          new GestureDetector(
            onTap: () {
              //todo 评论
            },
            child: new Container(
              margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: new Icon(Icons.comment),
            ),
          ),
//          new Container(
//            margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
//            child: new Icon(Icons.thumb_up),
//          ),
        ],
      ),
      body: new Center(
        child: new FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              //todo 显示
              if (snapshot.hasData) {
                mStrContent = snapshot.data.body;
                return new ListView(
                  children: <Widget>[
                    //  title
                    new Text(''),
                    getTitleList(),
                    getAuthorList(),
                    getContentList(),
                    new Text('\n\n'),
                  ],
                );
              }
              else if (snapshot.hasError) {
                return new Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            }
        ),
      ),
//      body: new ListView(
//        children: <Widget>[
//          //  title
//          new Text(''),
//          getTitleList(),
//          getAuthorList(),
//          getContentList(),
//          new Text('\n\n'),
//        ],
//      ),
    );
  }

  ListTile getTitleList() {
    return new ListTile(
      title: new Container(
        child: new Text(
          getTitle(),
          style: new TextStyle(
            color: Colors.black,
            fontSize: 22.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        margin: const EdgeInsets.all(8.0),
      ),
    );
  }

  ListTile getAuthorList() {
    return new ListTile(
      title: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              child: new Image.network(getImage(), width: 20.0,),
              margin: const EdgeInsets.only(right: 10.0),
            ),
            new Text(
              getAuthor(),
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            new Expanded(
              child: new Text(
                getBio(),
                style: new TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        padding: const EdgeInsets.all(4.0),
      ),
    );
  }

  ListTile getContentList() {
    return new ListTile(
      title: new Container(
        child: new Text(getContent()),
      ),
    );
  }

  String getTitle() {
    RegExp exp = new RegExp(r'<h1.*>(.*)</h1>');
    Match match = exp.firstMatch(mStrContent);
    int size = match.groupCount;
    return match.group(size);
  }

  String getImage() {
    RegExp exp = new RegExp(r'<img.*src="(.*?)">');
    Match match = exp.firstMatch(mStrContent);
    int size = match.groupCount;
    return match.group(size);
  }

  String getAuthor() {
    RegExp exp = new RegExp(r'<span.*class="author">(.*?)</span>');
    Match match = exp.firstMatch(mStrContent);
    int size = match.groupCount;
    return match.group(size);
  }

  String getBio() {
    RegExp exp = new RegExp(r'<span.*class="bio">(.*?)</span>');
    Match match = exp.firstMatch(mStrContent);
    int size = match.groupCount;
    return match.group(size);
  }

  String getContent() {
    RegExp exp = new RegExp(r'<p>(.*)</p>');
    Match match = exp.firstMatch(mStrContent);
    int size = match.groupCount;
    String temp = match.group(size);
    temp = temp.replaceAll(r'<p>', '\n');
    temp = temp.replaceAll(r'</p>', '\n');
    return temp;
  }
}

Future<Object> fetchData() async {
//    print('url--> ${getUrl(_mIndex)}');
//    NetUtil.get(getUrl(_mIndex), (responseJson) {
//      print('fetchData.responseJson--> $responseJson');
//      return new ThemeBean.fromJson(responseJson);
//    });
  final response = await http.get(Urls.CONTENT + _mId.toString());
  final responseJson = json.decode(response.body);
  print('responseJson--> $responseJson');
  print('\n');
  print('=============================');
  print('\n');
  return new DetailBean.fromJson(responseJson);
}