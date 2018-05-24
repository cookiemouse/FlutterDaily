// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ThemeBean.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ThemeBean _$ThemeBeanFromJson(Map<String, dynamic> json) => new ThemeBean(
    json['description'] as String,
    json['background'] as String,
    json['color'] as int,
    json['name'] as String,
    (json['stories'] as List)
        ?.map((e) => e == null
            ? null
            : new ThemeStoriesBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['image'] as String);

abstract class _$ThemeBeanSerializerMixin {
  String get description;
  String get background;
  int get color;
  String get name;
  String get image;
  List<ThemeStoriesBean> get stories;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': description,
        'background': background,
        'color': color,
        'name': name,
        'image': image,
        'stories': stories
      };
}

EditorsBean _$EditorsBeanFromJson(Map<String, dynamic> json) => new EditorsBean(
    json['url'] as String,
    json['bio'] as String,
    json['id'] as int,
    json['avatar'] as String,
    json['name'] as String);

abstract class _$EditorsBeanSerializerMixin {
  String get url;
  String get bio;
  int get id;
  String get avatar;
  String get name;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'bio': bio,
        'id': id,
        'avatar': avatar,
        'name': name
      };
}

ThemeStoriesBean _$ThemeStoriesBeanFromJson(Map<String, dynamic> json) =>
    new ThemeStoriesBean(
        json['title'] as String, json['type'] as int, json['id'] as int)
      ..images = (json['images'] as List)?.map((e) => e as String)?.toList();

abstract class _$ThemeStoriesBeanSerializerMixin {
  String get title;
  int get type;
  int get id;
  List<String> get images;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'type': type,
        'id': id,
        'images': images
      };
}
