import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../data/Urls.dart';

//公共的WebView页面，需要标题和URL参数
class DetailPage3 extends StatefulWidget {
  String title;
  String url;

  DetailPage3({Key key, this.title, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _DetailPage3PageState();
  }
}

class _DetailPage3PageState extends State<DetailPage3> {
  bool loading = true;

  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    // 监听WebView的加载事件
    flutterWebViewPlugin.onStateChanged.listen((state) {
//      if (state.type == WebViewState.finishLoad) {
//        // 加载完成
//        setState(() {
//          loading = false;
//        });
//      } else if (state.type == WebViewState.startLoad) {
//        setState(() {
//          loading = true;
//        });
//      }
    });
    flutterWebViewPlugin.onUrlChanged.listen((url) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      widget.title,
      style: new TextStyle(color: Colors.white),
    ));
    if (loading) {
      titleContent.add(new CupertinoActivityIndicator());
    }
    titleContent.add(new Container(width: 50.0));
    return new WebviewScaffold(
      url: widget.url,
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
      withJavascript: true,
    );
  }
}
