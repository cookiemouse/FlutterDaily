import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../data/Urls.dart';
import '../data/jsonbean/DetailBean.dart';
import 'package:html/parser.dart' show parse;
import 'package:flutter_html_textview/flutter_html_textview.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'DetailPage3.dart';


String mStrContent = r'Unknown';
String share_url = r'Unknown';
int _mId = 0;

class DetailPage2 extends StatefulWidget {

  final int id;

  DetailPage2(this.id) {
    _mId = id;
  }


  @override
  State createState() {
    return new _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage2> {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
//    flutterWebviewPlugin.close();

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
                share_url = snapshot.data.share_url;
//                Navigator.push(
//                  context,
//                  new MaterialPageRoute(
////                                builder: (context) => new DetailPage2(storiesItems[index].id),
//                    builder: (context) => new DetailPage3(title:'', url: share_url,),
//                  ),
//                );
//                return new SingleChildScrollView(
//                  child: new Text(getLink()),
//                  child: new Text(str),
//                );

//                return new SingleChildScrollView(
//                  child: new Text(_mId.toString() + '\n' + mStrContent),
//                );

//                return new SingleChildScrollView(
//                  child: new Center(
//                    child: new Text(document.outerHtml),
//                  ),
//                );

                return new WebviewScaffold(
                  url: share_url,
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
                  withZoom: true,
                  withLocalStorage: true,
                );

//                return new Text(share_url);
              }
              else if (snapshot.hasError) {
                return new Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}

Future<Object> fetchData() async {
  final response = await http.get(Urls.CONTENT + _mId.toString());
  final responseJson = json.decode(response.body);
  print('responseJson--> $responseJson');
  print('\n');
  print('=============================');
  print('\n');
  return new DetailBean.fromJson(responseJson);
}

String getLink() {
  RegExp exp = new RegExp(r'<a.*href="(.*?)">');
  Match match = exp.firstMatch(mStrContent);
  int size = match.groupCount;
  String temp = match.group(size);
  return temp;
}
