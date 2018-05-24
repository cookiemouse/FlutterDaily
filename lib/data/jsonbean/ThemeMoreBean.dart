import 'package:json_annotation/json_annotation.dart';
import 'ThemeBean.dart';

part 'ThemeMoreBean.g.dart';

@JsonSerializable()
class ThemeMoreBean{
  List<ThemeStoriesBean> stories;

  ThemeMoreBean(this.stories);

  factory ThemeMoreBean.fromJson(Map<String, dynamic> json) => _$ThemeMoreBeanFromJson(json);
}