class DetailBean {
  String body;
  String title;

  DetailBean({this.body, this.title});

  factory DetailBean.fromJson(Map<String, dynamic> json) {
    return new DetailBean(body: json['body'], title: json['title']);
  }
}