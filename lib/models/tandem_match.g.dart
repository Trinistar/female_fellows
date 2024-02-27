// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandem_match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandemMatch _$TandemMatchFromJson(Map<String, dynamic> json) => TandemMatch(
      requested: HelperFunctions.dateTimeFromTimestamp(
          json['requested'] as Timestamp?),
      state: $enumDecode(_$TandemMatchesStateEnumMap, json['state']),
      requester: json['requester'] as String,
      local: json['local'] as String,
      newcomer: json['newcomer'] as String,
      enabled: json['enabled'] as bool? ?? true,
      otherUserId: json['otherUserId'] as String? ?? '',
    );

Map<String, dynamic> _$TandemMatchToJson(TandemMatch instance) =>
    <String, dynamic>{};

const _$TandemMatchesStateEnumMap = {
  TandemMatchesState.requested: 'requested',
  TandemMatchesState.confirmed: 'confirmed',
  TandemMatchesState.declined: 'declined',
  TandemMatchesState.rerequested: 'rerequested',
};
