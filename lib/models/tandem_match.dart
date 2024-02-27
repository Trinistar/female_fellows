import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/enums.dart';
import 'package:vs_femalefellows/models/user_model.dart';

part 'tandem_match.g.dart';

@JsonSerializable()
class TandemMatch {
  TandemMatch({
    required this.requested,
    required this.state,
    required this.requester,
    required this.local,
    required this.newcomer,
    this.enabled = true,
    this.otherProfile,
    this.otherUserId = '',
  });

  factory TandemMatch.fromJson(Map<String,dynamic> json)=>_$TandemMatchFromJson(json);
  Map<String, dynamic> toJson()=> _$TandemMatchToJson(this);

  @JsonKey(fromJson: HelperFunctions.dateTimeFromTimestamp, toJson: HelperFunctions.dateTimeAsIs, includeToJson: false)
  final Timestamp requested;
  @JsonKey(includeToJson: false)
  final TandemMatchesState state;
  @JsonKey(includeToJson: false)
  final String requester;
  @JsonKey(includeToJson: false)
  final String local;
  @JsonKey(includeToJson: false)
  final String newcomer;
  @JsonKey(defaultValue: true, includeToJson: false)
  final bool enabled;
  @JsonKey(includeFromJson: false, includeToJson: false)
  FFUser? otherProfile;
  @JsonKey(defaultValue: '', includeToJson: false)
  String otherUserId;
}
