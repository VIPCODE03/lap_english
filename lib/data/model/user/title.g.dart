// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      award: Reward.fromJson(json['award'] as Map<String, dynamic>),
      completed: (json['completed'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      isRewardClaimed: json['isRewardClaimed'] as bool,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'award': instance.award.toJson(),
      'completed': instance.completed,
      'total': instance.total,
      'isRewardClaimed': instance.isRewardClaimed,
    };

Reward _$RewardFromJson(Map<String, dynamic> json) => Reward(
      name: json['name'] as String,
      rewardType: $enumDecode(_$RewardTypeEnumMap, json['rewardType']),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$RewardToJson(Reward instance) => <String, dynamic>{
      'name': instance.name,
      'rewardType': _$RewardTypeEnumMap[instance.rewardType]!,
      'quantity': instance.quantity,
    };

const _$RewardTypeEnumMap = {
  RewardType.diamond: 'diamond',
  RewardType.gold: 'gold',
};
