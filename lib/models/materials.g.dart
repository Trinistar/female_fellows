// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventMaterials _$EventMaterialsFromJson(Map<String, dynamic> json) =>
    EventMaterials(
      planer: json['planer'] as String? ?? '',
      food: json['food'] as String? ?? '',
      information: json['information'] as String? ?? '',
      clothes: json['clothes'] as String? ?? '',
    );

Map<String, dynamic> _$EventMaterialsToJson(EventMaterials instance) =>
    <String, dynamic>{
      'planer': instance.planer,
      'food': instance.food,
      'information': instance.information,
      'clothes': instance.clothes,
    };
