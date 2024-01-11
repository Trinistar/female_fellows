// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventParticipant _$EventParticipantFromJson(Map<String, dynamic> json) =>
    EventParticipant(
      participating: json['participating'] as bool,
      userId: json['userId'] as String,
      interpreter:
          Interpreter.fromJson(json['interpreter'] as Map<String, dynamic>),
      childCare: ChildCare.fromJson(json['childCare'] as Map<String, dynamic>),
      mediaConsent: json['mediaConsent'] as bool,
    );

Map<String, dynamic> _$EventParticipantToJson(EventParticipant instance) =>
    <String, dynamic>{
      'participating': instance.participating,
      'userId': instance.userId,
      'interpreter': instance.interpreter.toJson(),
      'childCare': instance.childCare.toJson(),
      'mediaConsent': instance.mediaConsent,
    };

Interpreter _$InterpreterFromJson(Map<String, dynamic> json) => Interpreter(
      needed: json['needed'] as bool,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$InterpreterToJson(Interpreter instance) =>
    <String, dynamic>{
      'needed': instance.needed,
      'language': instance.language,
    };

ChildCare _$ChildCareFromJson(Map<String, dynamic> json) => ChildCare(
      needed: json['needed'] as bool,
      childName: json['childName'] as String?,
    );

Map<String, dynamic> _$ChildCareToJson(ChildCare instance) => <String, dynamic>{
      'needed': instance.needed,
      'childName': instance.childName,
    };
