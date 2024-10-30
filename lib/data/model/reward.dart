import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/user/user.dart';

import '../../gen/assets.gen.dart';

part 'reward.g.dart';

@JsonSerializable()
class Reward {
  final String name;
  final RewardType rewardType;
  final int quantity;
  bool isRewardClaimed;

  Reward({
    required this.name,
    required this.rewardType,
    required this.quantity,
    this.isRewardClaimed = false,
  });

  String get icon {
    switch(rewardType) {
      case RewardType.diamond:
        return Assets.images.icon.dimound.path;
      case RewardType.gold:
        return Assets.images.icon.gold.path;
      default:
        throw ArgumentError('Invalid reward type');
    }
  }

  claimReward(User user) {
    switch(rewardType) {
      case RewardType.diamond:
        user.cumulativePoint.diamond += quantity;
        break;
      case RewardType.gold:
        user.cumulativePoint.gold += quantity;
        break;
    }
    isRewardClaimed = true;
  }

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  Map<String, dynamic> toJson() => _$RewardToJson(this);
}

enum RewardType { diamond, gold }