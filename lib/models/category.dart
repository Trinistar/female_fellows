import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class Category {
  Category({
    required this.id,
    required this.translation,
  });

  final int id;
  final Translation translation;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Translation {
  Translation({
    required this.de,
    required this.en,
  });

  final String de;
  final String en;

  factory Translation.fromJson(Map<String, dynamic> json) => _$TranslationFromJson(json);
  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
