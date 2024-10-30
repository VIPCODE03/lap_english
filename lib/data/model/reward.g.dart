// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reward _$RewardFromJson(Map<String, dynamic> json) => Reward(
      name: json['name'] as String,
      rewardType: $enumDecode(_$RewardTypeEnumMap, json['rewardType']),
      quantity: (json['quantity'] as num).toInt(),
      isRewardClaimed: json['isRewardClaimed'] as bool? ?? false,
    );

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'name': instance.name,
      'rewardType': _$RewardTypeEnumMap[instance.rewardType]!,
      'quantity': instance.quantity,
      'isRewardClaimed': instance.isRewardClaimed,
    };

const _$RewardTypeEnumMap = {
  RewardType.diamond: 'diamond',
  RewardType.gold: 'gold',
};
