import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vs_femalefellows/helper_functions.dart';
import 'package:vs_femalefellows/models/enums.dart';

part 'tandem_match.g.dart';

@JsonSerializable()
class TandemMatch {
  TandemMatch({
    required this.requested,
    required this.state,
    required this.requester,
    required this.local,
    required this.newcomer,
  });

  factory TandemMatch.fromJson(Map<String,dynamic> json)=>_$TandemMatchFromJson(json);
  Map<String, dynamic> toJson()=> _$TandemMatchToJson(this);

  @JsonKey(fromJson: HelperFunctions.dateTimeFromTimestamp, toJson: HelperFunctions.dateTimeAsIs)
  final Timestamp requested;
  final TandemMatchesState state;
  final String requester;
  final String local;
  final String newcomer;
}
