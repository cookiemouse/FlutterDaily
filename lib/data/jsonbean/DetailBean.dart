class DetailBean {
  String body;
  String title;
  String share_url;

  DetailBean({this.body, this.title, this.share_url});

  factory DetailBean.fromJson(Map<String, dynamic> json) {
    return new DetailBean(body: json['body'], title: json['title'], share_url:json['share_url']);
  }
}