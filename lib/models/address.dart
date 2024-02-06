import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
@immutable
class Address {
  const Address({
    this.city = '',
    this.street = '',
    this.zipCode = '',
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @JsonKey(defaultValue: '')
  final String city;
  @JsonKey(defaultValue: '')
  final String street;
  @JsonKey(defaultValue: '')
  final String zipCode;
}