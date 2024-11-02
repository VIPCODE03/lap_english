// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cumulative_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CumulativePoint _$CumulativePointFromJson(Map<String, dynamic> json) =>
    CumulativePoint(
      (json['diamond'] as num).toInt(),
      (json['gold'] as num).toInt(),
      (json['rankPoints'] as num).toInt(),
    );

Map<String, dynamic> _$CumulativePointToJson(CumulativePoint instance) =>
    <String, dynamic>{
      'diamond': instance.diamond,
      'gold': instance.gold,
      'rankPoints': instance.rankPoints,
    };
