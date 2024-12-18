// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reward _$RewardFromJson(Map<String, dynamic> json) => Reward(
      diamond: (json['diamond'] as num).toInt(),
      gold: (json['gold'] as num).toInt(),
      isRewardClaimed: json['isRewardClaimed'] as bool? ?? false,
    );

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'gold': instance.gold,
      'diamond': instance.diamond,
      'isRewardClaimed': instance.isRewardClaimed,
    };
