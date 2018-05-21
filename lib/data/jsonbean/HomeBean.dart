import 'package:json_annotation/json_annotation.dart';

part 'HomeBean.g.dart';

@JsonSerializable()
class HomeBean extends Object with _$HomeBeanSerializerMixin{
  String date;
  List<StoryBean> stories;
  List<TopStoriesBean> top_stories;


  HomeBean(this.date, this.stories);

  factory HomeBean.fromJson(Map<String, dynamic> json) => _$HomeBeanFromJson(json);
}

@JsonSerializable()
class StoryBean extends Object with _$StoryBeanSerializerMixin{
  String title;
  String ga_prefix;
  List<String> images;
  bool multipic;
  int type;
  int id;


  StoryBean(
      this.title,
      this.ga_prefix,
      this.images,
      this.multipic,
      this.type,
      this.id
      );

  factory StoryBean.fromJson(Map<String, dynamic> json) => _$StoryBeanFromJson(json);
}

@JsonSerializable()
class TopStoriesBean extends Object with _$TopStoriesBeanSerializerMixin{
  String image;
  int type;
  int id;
  String ga_prefix;
  String title;

  TopStoriesBean(
      this.image,
      this.type,
      this.id,
      this.ga_prefix,
      this.title
      );

  factory TopStoriesBean.fromJson(Map<String ,dynamic> json) => _$TopStoriesBeanFromJson(json);


}
