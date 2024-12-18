import 'package:json_annotation/json_annotation.dart';
import 'package:lap_english/data/model/user/user.dart';

part 'reward.g.dart';

@JsonSerializable()
class Reward {
  final RewardType rewardType;
  final int quantity;
  bool isRewardClaimed;

  Reward({
    required this.rewardType,
    required this.quantity,
    this.isRewardClaimed = false,
  });

  String get name {
    switch(rewardType) {
      case RewardType.diamond:
        return "Kim cương";
      case RewardType.gold:
        return "Vàng";
      default:
        throw ArgumentError('Invalid reward type');
    }
  }

  String get icon {
    switch(rewardType) {
      case RewardType.diamond:
        return 'assets/images/icon/dimound.png';
      case RewardType.gold:
        return 'assets/images/icon/gold.png';
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