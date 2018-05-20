// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeBean.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

HomeBean _$HomeBeanFromJson(Map<String, dynamic> json) => new HomeBean(
    json['date'] as String,
    (json['stories'] as List)
        ?.map((e) => e == null
            ? null
            : new StoryBean.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$HomeBeanSerializerMixin {
  String get date;
  List<StoryBean> get stories;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'date': date, 'stories': stories};
}

StoryBean _$StoryBeanFromJson(Map<String, dynamic> json) => new StoryBean(
    json['title'] as String,
    json['ga_prefix'] as String,
    (json['images'] as List)?.map((e) => e as String)?.toList(),
    json['multipic'] as bool,
    json['type'] as int,
    json['id'] as int);

abstract class _$StoryBeanSerializerMixin {
  String get title;
  String get ga_prefix;
  List<String> get images;
  bool get multipic;
  int get type;
  int get id;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'ga_prefix': ga_prefix,
        'images': images,
        'multipic': multipic,
        'type': type,
        'id': id
      };
}
