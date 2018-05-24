// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ThemeMoreBean.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ThemeMoreBean _$ThemeMoreBeanFromJson(Map<String, dynamic> json) =>
    new ThemeMoreBean((json['stories'] as List)
        ?.map((e) => e == null
            ? null
            : new ThemeStoriesBean.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$ThemeMoreBeanSerializerMixin {
  List<ThemeStoriesBean> get stories;
  Map<String, dynamic> toJson() => <String, dynamic>{'stories': stories};
}
