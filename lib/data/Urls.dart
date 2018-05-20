class Urls {

  //  最新消息
  static const String LATEST = 'https://news-at.zhihu.com/api/4/news/latest';

  //  过往消息
  static const String BEFORE = 'https://news-at.zhihu.com/api/4/news/before/';//{+date}

  //  新闻额外消息
  static const String STORY_EXTRA = 'https://news-at.zhihu.com/api/4/story-extra/';//{+id}

  //  新闻长评论
  static const String LONG_COMMENTS = 'https://news-at.zhihu.com/api/4/story/8997528/long-comments'; //{数字为id}

  //  新闻短评论
  static const String SHORT_COMMENTS = 'https://news-at.zhihu.com/api/4/story/4232852/short-comments';//{数字为id}

  //  Drawer列表，主题
  static const String THEMES_LIST = 'https://news-at.zhihu.com/api/4/themes';

  //  主题内容
  static const String THEMES_CONTENT = 'https://news-at.zhihu.com/api/4/theme/11';

  //  某个主题之前的内容
  static const String THEMES_BEFORE = 'https://news-at.zhihu.com/api/4/theme/#{theme_id}/before/#{story_id}';

}