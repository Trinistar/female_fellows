import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'materials.g.dart';

@JsonSerializable()
@immutable
class EventMaterials {
  const EventMaterials({
    this.planer = '',
    this.book = '',
    this.food = '',
    this.information = '',
    this.clothes = '',
  });

  factory EventMaterials.fromJson(Map<String, dynamic> json) =>
      _$EventMaterialsFromJson(json);
  Map<String, dynamic> toJson() => _$EventMaterialsToJson(this);

  @JsonKey(defaultValue: '')
  final String planer;
  @JsonKey(defaultValue: '')
  final String book;
  @JsonKey(defaultValue: '')
  final String food;
  @JsonKey(defaultValue: '')
  final String information;
  @JsonKey(defaultValue: '')
  final String clothes;
}
