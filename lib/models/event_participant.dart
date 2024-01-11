import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_participant.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class EventParticipant {
  EventParticipant({
    required this.participating,
    required this.userId,
    required this.interpreter,
    required this.childCare,
    required this.mediaConsent,
  });

  final bool participating;
  final String userId;
  final Interpreter interpreter;
  final ChildCare childCare;
  final bool mediaConsent;

  factory EventParticipant.fromJson(Map<String, dynamic> json) => _$EventParticipantFromJson(json);
  Map<String, dynamic> toJson() => _$EventParticipantToJson(this);
}

@JsonSerializable()
class Interpreter {
  Interpreter({
    required this.needed,
    required this.language,
  });

  final bool needed;
  final String? language;

  factory Interpreter.fromJson(Map<String, dynamic> json) => _$InterpreterFromJson(json);
  Map<String, dynamic> toJson() => _$InterpreterToJson(this);
}

@JsonSerializable()
class ChildCare {
  ChildCare({
    required this.needed,
    required this.childName,
  });

  final bool needed;
  final String? childName;

  factory ChildCare.fromJson(Map<String, dynamic> json) => _$ChildCareFromJson(json);
  Map<String, dynamic> toJson() => _$ChildCareToJson(this);
}
