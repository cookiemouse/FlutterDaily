import 'package:json_annotation/json_annotation.dart';

part 'ThemeBean.g.dart';

@JsonSerializable()
class ThemeBean{
  String description;
  String background;
  int color;
  String name;
  String image;
  List<ThemeStoriesBean> stories;

  ThemeBean(this.description, this.background, this.color, this.name, this.stories, this.image);

  factory ThemeBean.fromJson(Map<String, dynamic> json) => _$ThemeBeanFromJson(json);
}

@JsonSerializable()
class EditorsBean{
  String url;
  String bio;
  int id;
  String avatar;
  String name;

  EditorsBean(this.url, this.bio, this.id, this.avatar, this.name);

  factory EditorsBean.fromJson(Map<String, dynamic> json) => _$EditorsBeanFromJson(json);
}

@JsonSerializable()
class ThemeStoriesBean{
  String title;
  int type;
  int id;
  List<String> images = [];

  ThemeStoriesBean(this.title, this.type, this.id);

  factory ThemeStoriesBean.fromJson(Map<String, dynamic> json) => _$ThemeStoriesBeanFromJson(json);
}