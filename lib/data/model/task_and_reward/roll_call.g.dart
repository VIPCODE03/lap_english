// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roll_call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RollCall _$RollCallFromJson(Map<String, dynamic> json) => RollCall(
      currentDay: (json['currentDay'] as num).toInt(),
      days: (json['days'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      rewards: (json['rewards'] as List<dynamic>)
          .map((e) => Reward.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RollCallToJson(RollCall instance) => <String, dynamic>{
      'currentDay': instance.currentDay,
      'days': instance.days,
      'rewards': instance.rewards,
    };
