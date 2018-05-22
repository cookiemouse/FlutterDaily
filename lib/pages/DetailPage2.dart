import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../data/Urls.dart';
import '../data/jsonbean/DetailBean.dart';
import 'package:flutter_html_textview/flutter_html_textview.dart';

String mStrContent = r'<body><div class="main-wrap content-wrap"> <div class="headline"> <h1 class="headline-title onlyheading">我们在购买艺术品的时候都会考虑哪些因素？</h1> </div> <div class="content-inner"> <div class="question"> <h2 class="question-title"></h2> <div class="answer"> <div class="meta"> <img class="avatar" src="http://pic1.zhimg.com/769c2607caaf67449d6547145fd2403c_is.jpg"> <span class="author">王琨，</span><span class="bio">yishuzs.com 关注当代艺术</span> </div> <div class="content"> <p>1.首先要看自己是否喜欢这件作品，作品题材、风格是否原创而且有艺术家的个人特色，不建议买千篇一律的装饰画，或者风格不明显没有辨识度的艺术品；你可能需要看看艺术家的其他作品，是否有统一风格，以及艺术家个人特色的连续性与逐年的成长进步；</p> <p>2. 然后看作品材质是否易于保存，例如油画，用心的艺术家会手工绷画布，用比较好的颜料绘画，画面干净，画框边缘整洁，并且还会用上光油等方式来保护作品；成品画框或画板加劣质颜料就不要买了；</p> <p>3. 看艺术家对于经营自己的用心程度，例如是否是职业艺术家，如果上班的话是否连贯的用业余时间进行创作，一年能出多少件作品，是否和很多艺术网站、机构合作，未来的职业规划等？如果是玩票的艺术家，他画了 2 年坚持不下去就再也不画了，这也意味着作品在将来没有任何升值空间；</p> <p>说说价格：</p> <p>4. 对于不知名的年轻艺术家，而且无历史交易价格作为参考，一般按照作品的尺寸、画面品质、完成度，以及艺术家的年龄、创作所耗费的时间心血，进行价格的估算。对于 80 后年轻艺术家，如果没有什么名气，我一般的标准是 1 米 x1 米的作品最多给到 2 万元，然后按照尺寸计算价格，作品品质一般，单价更低，特别好的作品会多出一些价格；</p> <p>5. 对于画廊或艺术机构代理的艺术家，因为有明确的标价、以及历史交易价格作为参考，这时候 1 是考虑是否能以低于标价的价格买到作品，可以通过微信拍卖、展出最后几天打折、或者找熟人等方式实现；如果艺术家没有代理画廊，只是部分作品被一些机构代理，这时候可以想办法联系艺术家直接购买，可能能拿到一些折扣；另外还可以通过艺术家的朋友、dealer、以及他的藏家购买也会比较便宜，不过不太好找到；</p> <p>6. 对于知名艺术家，我没有买过，但可以给些建议。要多观察拍卖市场中艺术家不同时期、系列作品的价格走向，然后和画廊售价进行比较，来决定通过什么方式来购买。同时也要看藏家的眼光以及对市场走向的观察，例如一个艺术家作品价格下降，有可能是失去收藏的潜力，也可能是购买的窗口期，这就要看您的眼光如何了，建议雇一个专业的收藏顾问，或找行内人士多交流学习。</p> <p>另外，购买艺术品有时候也会形成冲动购物，所以购买前您可以思考一下，这个价格买其他艺术品，或者买其他东西是否对现阶段的自己更有意义，更有价值。</p> </div> </div> <div class="view-more"><a href="http://www.zhihu.com/question/36117839">查看知乎讨论<span class="js-question-holder"></span></a></div> </div> </div> </div></body>';
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
//                mStrContent = snapshot.data.body;
//                return new SingleChildScrollView(
//                  child: new HtmlTextView(
//                    data: mStrContent,
//                  ),
//                );
//                return new SingleChildScrollView(
//                  child: new Text(_mId.toString() + '\n' + mStrContent),
//                );
                return new SingleChildScrollView(
                  child: new Center(
                    child: new HtmlTextView(
                      data: mStrContent,
                    ),
                  ),
                );
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
