import 'Urls.dart';

class BaseData{
  String url;
  int id;
  String title;

  BaseData(this.url, {this.id, this.title});
}

final List<BaseData> mBaseData = [
  new BaseData(Urls.LATEST, title: '首页'),
  new BaseData(Urls.THEMES_CONTENT, id: 13, title: '日常心理学'),
  new BaseData(Urls.THEMES_CONTENT, id: 12, title: '用户推荐日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 3, title: '电影日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 11, title: '不许无聊'),
  new BaseData(Urls.THEMES_CONTENT, id: 4, title: '设计日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 5, title: '大公司日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 6, title: '财经日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 10, title: '互联网安全'),
  new BaseData(Urls.THEMES_CONTENT, id: 2, title: '开始游戏'),
  new BaseData(Urls.THEMES_CONTENT, id: 7, title: '音乐日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 9, title: '动漫日报'),
  new BaseData(Urls.THEMES_CONTENT, id: 8, title: '体育日报'),
];

String getUrl(int index) {
  if (index == 0) {
    return mBaseData[index].url;
  }
  return mBaseData[index].url + mBaseData[index].id.toString();
}